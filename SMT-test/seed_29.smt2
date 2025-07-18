(set-logic QF_BV)
(set-option :produce-models true)
(declare-const bv_0 (_ BitVec 256))
(declare-const bv_1 (_ BitVec 256))
(declare-const bv_2 (_ BitVec 256))
(declare-const bv_3 (_ BitVec 256))
(declare-const bv_4 (_ BitVec 256))
(declare-const bv_5 (_ BitVec 256))
(declare-const bv_6 Bool)
(declare-const bv_7 (_ BitVec 256))
(declare-const bv_8 (_ BitVec 256))
(declare-const bv_9 (_ BitVec 256))
(declare-const bv_10 Bool)
(declare-const bv_11 (_ BitVec 256))
(declare-const bv_12 (_ BitVec 256))
(declare-const bv_13 (_ BitVec 256))
(declare-const bv_14 (_ BitVec 256))
(declare-const bv_15 (_ BitVec 256))
(declare-const bv_16 (_ BitVec 256))
(declare-const bv_17 (_ BitVec 256))
(declare-const bv_18 (_ BitVec 256))
(declare-const bv_19 (_ BitVec 256))
(declare-const bv_20 (_ BitVec 256))
(declare-const bv_21 (_ BitVec 256))
(declare-const bv_22 (_ BitVec 256))
(declare-const bv_23 (_ BitVec 256))
(declare-const bv_24 (_ BitVec 256))
(declare-const bv_25 (_ BitVec 256))
(declare-const bv_26 (_ BitVec 256))
(declare-const bv_27 (_ BitVec 256))
(declare-const bv_28 (_ BitVec 256))
(declare-const bv_29 (_ BitVec 256))
(declare-const bv_30 (_ BitVec 256))
(declare-const bv_31 (_ BitVec 256))
(declare-const bv_32 (_ BitVec 256))
(declare-const bv_33 Bool)
(declare-const bv_34 (_ BitVec 256))
(declare-const bv_35 (_ BitVec 256))
(assert (= bv_2 (bvlshr bv_1 bv_0)))
(assert (= bv_3 (bvadd bv_0 bv_2)))
(assert (= bv_4 (bvor bv_1 bv_3)))
(assert (= bv_5 (bvshl bv_0 bv_3)))
(assert (= bv_6 (bvsge bv_0 bv_2)))
(assert (= bv_7 (bvadd bv_3 bv_5)))
(assert (= bv_8 (bvsub bv_0 bv_1)))
(assert (= bv_9 (bvudiv bv_1 bv_0)))
(assert (= bv_10 (bvule bv_2 bv_8)))
(assert (= bv_11 (bvor bv_5 bv_9)))
(assert (= bv_12 (bvadd bv_5 bv_3)))
(assert (= bv_13 (bvsub bv_5 bv_7)))
(assert (= bv_14 (bvsub bv_2 bv_0)))
(assert (= bv_15 (bvor bv_14 bv_11)))
(assert (= bv_16 (bvadd bv_3 bv_4)))
(assert (= bv_17 (bvand bv_1 bv_8)))
(assert (= bv_18 (bvnot bv_0)))
(assert (= bv_19 (bvsub bv_1 bv_15)))
(assert (= bv_20 (bvxor bv_13 bv_0)))
(assert (= bv_21 (bvxor bv_16 bv_19)))
(assert (= bv_22 (bvshl bv_5 bv_16)))
(assert (= bv_23 (bvxor bv_16 bv_17)))
(assert (= bv_24 (bvsrem bv_17 bv_19)))
(assert (= bv_25 (bvand bv_0 bv_23)))
(assert (= bv_26 (bvor bv_8 bv_17)))
(assert (= bv_27 (bvnot bv_26)))
(assert (= bv_28 (bvor bv_11 bv_22)))
(assert (= bv_29 (bvlshr bv_18 bv_13)))
(assert (= bv_30 (bvneg bv_22)))
(assert (= bv_31 (bvxor bv_18 bv_4)))
(assert (= bv_32 (bvshl bv_21 bv_13)))
(assert (= bv_33 (bvslt bv_30 bv_14)))
(assert (= bv_34 (bvmul bv_8 bv_16)))
(assert (= bv_35 (bvor bv_8 bv_13)))
(declare-const z_0 Bool)
(declare-const z_1 Bool)
(declare-const z_2 Bool)
(declare-const z_3 Bool)
(declare-const z_4 Bool)
(declare-const z_5 Bool)
(declare-const z_6 Bool)
(declare-const z_7 Bool)
(declare-const z_8 Bool)
(declare-const z_9 Bool)
(assert (= z_0 (= bv_32 bv_19)))
(assert (= z_1 (= bv_7 bv_31)))
(assert (= z_2 (= bv_11 bv_27)))
(assert (= z_3 (= bv_24 bv_26)))
(assert (= z_4 (= bv_34 bv_8)))
(assert (= z_5 (= bv_17 bv_23)))
(assert (= z_6 (= bv_35 bv_15)))
(assert (= z_7 (= bv_18 bv_29)))
(assert (= z_8 (= bv_2 bv_22)))
(assert (= z_9 (= bv_33 bv_10)))
(assert ( and ( or ( and ( and z_8 z_4 ) z_9 ) z_2 ) ( and z_6 ( and ( and z_5 z_7 ) ( and ( or z_0 z_1 ) z_3 ) ) ) ) )
(check-sat)
(get-model)
(exit)
