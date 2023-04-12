(* ****** ****** *)
use
"mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-04-07: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(*
For a list [1,2,3]

1. xs = []
   xss = [[0]]

2. xs = [3]
   xss = [[0,3],[3,0]]

3. xs = [2,3]
   xss = [[0,2,3],[2,0,3],[2,3,0]]

4. xs = [1,2,3]
   xss = [[0,1,2,3], [1,0,2,3], [1,2,0,3], [1,2,3,0]]
*)

fun insert(a: 'a, ls: 'a list) =
   #2 (list_foldright (ls, ([], [[a]]), fn ((xs, xss), x) =>
        let val xs = x :: xs
        in
            (xs, (a :: xs) :: list_map(xss, fn xs0 => x :: xs0))
        end))

fun perm (xs: 'a list) =
    case xs of
        [] => [[]]
        |
        x :: xs => 
            let val xss = perm(xs)
            in
              list_concat (list_map (xss, fn xs0 => insert (x, xs0)))
            end

fun bruh(xs: 'a list list) =
    list_streamize(xs)
(*
Python ver:

    def insert (a, xs):
        yield [a] + xs
        if xs != []:
            hd = xs[0]
            tl = xs[1:]
            for res in insert(a, tl):
                yield [hd] + res
        return None
    
    def perm(xs):
        if xs == []:
            yield []
        else:
            hd = xs[0]
            tl = [1:]
            for pxs in perm(tl):
                for ixs in insert(hd, pxs):
                    yield ixs
            return None

*)

(*
Streamized ver of bin trees

datatype 'a btree =
    BLeaf
        | BNode of 'a btree * 'a * 'a btree

fun streamize_btree (tr: 'a btree, merge: ('a stream * 'a * 'a stream) -> 'a stream) : 'a stream =
    fn () =>
        case tr of
            BLeaf => strcon_nil
            |
            BNode (l, a, r) =>
                let val l_st = streamize_btree (l, merge)
                    val r_st = streamize_btree (r, merge)
                in
                    merge (l_st, a, r_st) ()
                end

fun preord_btree (tr: 'a btree) =
    streamize_btree (tr, fn (l_st, a, r_st) =>
        stream_cons (a, stream_append (l_st, r_st)))

fun inord_btree (tr: 'a btree) =
    streamize_btree (tr, fn (l_st, a, r_st) =>
        stream_append(l_st, stream_cons(a, r_st)))

fun postord_btree (tr: 'a btree) =
    streamize (tr, fn (l_st, a, r_st) =>
        let val st = stream_cons(a, stream_nil())
        stream_append(stream_append(l_st, r_st), st)

fun take (l: int, st: 'a stream): 'a list =
    if i <= 0 then
        []
    else
        case st () of
            strcon_nil => []
            |
            strcon_cons (a, st) => a :: take (i - 1, st)

FOR GTREES

datatype 'a gtree = 
    GLeaf
    | GNode of 'a * 'a gtree list

fun streamize_gtree (tr: 'a gtree, merge: ('a * 'a stream list) -> 'a stream): 'a stream =
    fn () =>
        case tr of
            GLeaf => strcon_nil
            |
            GNode (a, trs) =>
                let val sts = list_map (trs, fn tr => streamize_gtree (tr, merge))
                in merge (a, sts) ()
                end

fun preord_gtree (tr: 'a gtree) =
    streamize_gtree (tr, fn (a, sts) =>
        )
*)
fun mkList (n: int) : int list =
    if n <= 0 then [] else n :: mkList (n - 1)

fun
stream_permute_list(xs: 'a list): 'a list stream =
    let
      val strom = list_streamize(xs)
    in
      strom

    end
    

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign08-01.sml] *)