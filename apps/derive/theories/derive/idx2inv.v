(* Generates lemmas linking an inductive with indexes and its structural
   copy without indexes but equations instead.

   license: GNU Lesser General Public License Version 2.1 or later           
   ------------------------------------------------------------------------- *)

From elpi Require Export elpi. From elpi.apps Require Export derive.param1 derive.param1_functor derive.invert.

Elpi Db derive.idx2inv.db lp:{{
  type idx2inv-db inductive -> inductive -> constant -> constant -> prop.
}}.

Elpi Command derive.idx2inv.
Elpi Accumulate File "paramX-lib.elpi".
Elpi Accumulate Db derive.param1.db.
Elpi Accumulate Db derive.param1.functor.db.
Elpi Accumulate File "elpi/param1_functor.elpi".
Elpi Accumulate Db derive.invert.db.
Elpi Accumulate Db derive.idx2inv.db.
Elpi Accumulate File "elpi/idx2inv.elpi".
Elpi Accumulate lp:{{
  main [str I, str O] :- !, coq.locate I (indt GR), derive.idx2inv.main GR O _.
  main [str I] :- !, coq.locate I (indt GR), derive.idx2inv.main GR "_to_" _.
  main _ :- usage.

  usage :- coq.error "Usage: derive.idx2inv <inductive type name> [<separator>]".
}}.
Elpi Typecheck.
