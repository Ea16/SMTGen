(set-logic QF_BV)
(set-option :produce-models true)
(declare-const bv_0 (_ BitVec 256))
(declare-const bv_1 (_ BitVec 256))
(declare-const bv_2 (_ BitVec 256))
(declare-const bv_3 (_ BitVec 256))
(declare-const bv_4 (_ BitVec 256))
(declare-const bv_5 Bool)
(declare-const bv_6 (_ BitVec 256))
(declare-const bv_7 Bool)
(declare-const bv_8 (_ BitVec 256))
(declare-const bv_9 (_ BitVec 256))
(declare-const bv_10 (_ BitVec 256))
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
(declare-const bv_27 Bool)
(declare-const bv_28 (_ BitVec 256))
(declare-const bv_29 (_ BitVec 256))
(declare-const bv_30 (_ BitVec 256))
(declare-const bv_31 Bool)
(declare-const bv_32 (_ BitVec 256))
(declare-const bv_33 (_ BitVec 256))
(declare-const bv_34 Bool)
(declare-const bv_35 (_ BitVec 256))
(declare-const bv_36 (_ BitVec 256))
(declare-const bv_37 (_ BitVec 256))
(declare-const bv_38 Bool)
(declare-const bv_39 (_ BitVec 256))
(declare-const bv_40 (_ BitVec 256))
(declare-const bv_41 (_ BitVec 256))
(declare-const bv_42 (_ BitVec 256))
(declare-const bv_43 (_ BitVec 256))
(declare-const bv_44 (_ BitVec 256))
(declare-const bv_45 (_ BitVec 256))
(declare-const bv_46 (_ BitVec 256))
(declare-const bv_47 (_ BitVec 256))
(declare-const bv_48 (_ BitVec 256))
(declare-const bv_49 (_ BitVec 256))
(declare-const bv_50 (_ BitVec 256))
(declare-const bv_51 Bool)
(declare-const bv_52 (_ BitVec 256))
(declare-const bv_53 (_ BitVec 256))
(declare-const bv_54 (_ BitVec 256))
(declare-const bv_55 Bool)
(declare-const bv_56 Bool)
(declare-const bv_57 (_ BitVec 256))
(declare-const bv_58 (_ BitVec 256))
(declare-const bv_59 (_ BitVec 256))
(declare-const bv_60 (_ BitVec 256))
(assert (= bv_2 (bvadd bv_1 bv_0)))
(assert (= bv_3 (bvadd bv_2 bv_1)))
(assert (= bv_4 (bvand bv_1 bv_3)))
(assert (= bv_5 (bvuge bv_2 bv_1)))
(assert (= bv_6 (bvnot bv_4)))
(assert (= bv_7 (bvslt bv_1 bv_4)))
(assert (= bv_8 (bvor bv_4 bv_1)))
(assert (= bv_9 (bvor bv_1 bv_6)))
(assert (= bv_10 (bvneg bv_6)))
(assert (= bv_11 (bvshl bv_4 bv_9)))
(assert (= bv_12 (bvand bv_3 bv_0)))
(assert (= bv_13 (bvudiv bv_10 bv_0)))
(assert (= bv_14 (bvsrem bv_8 bv_13)))
(assert (= bv_15 (bvneg bv_0)))
(assert (= bv_16 (bvlshr bv_15 bv_11)))
(assert (= bv_17 (bvnot bv_13)))
(assert (= bv_18 (bvlshr bv_9 bv_4)))
(assert (= bv_19 (bvlshr bv_0 bv_12)))
(assert (= bv_20 (bvsrem bv_19 bv_15)))
(assert (= bv_21 (bvneg bv_13)))
(assert (= bv_22 (bvxor bv_21 bv_9)))
(assert (= bv_23 (bvshl bv_2 bv_12)))
(assert (= bv_24 (bvxor bv_3 bv_17)))
(assert (= bv_25 (bvand bv_20 bv_11)))
(assert (= bv_26 (bvnot bv_23)))
(assert (= bv_27 (bvugt bv_16 bv_17)))
(assert (= bv_28 (bvxor bv_20 bv_11)))
(assert (= bv_29 (bvadd bv_23 bv_10)))
(assert (= bv_30 (bvor bv_23 bv_13)))
(assert (= bv_31 (bvslt bv_22 bv_19)))
(assert (= bv_32 (bvor bv_14 bv_11)))
(assert (= bv_33 (bvneg bv_23)))
(assert (= bv_34 (bvsgt bv_6 bv_32)))
(assert (= bv_35 (bvlshr bv_2 bv_29)))
(assert (= bv_36 (bvnot bv_29)))
(assert (= bv_37 (bvshl bv_9 bv_3)))
(assert (= bv_38 (bvsgt bv_13 bv_11)))
(assert (= bv_39 (bvlshr bv_33 bv_22)))
(assert (= bv_40 (bvadd bv_12 bv_9)))
(assert (= bv_41 (bvadd bv_36 bv_10)))
(assert (= bv_42 (bvand bv_8 bv_13)))
(assert (= bv_43 (bvneg bv_33)))
(assert (= bv_44 (bvand bv_37 bv_24)))
(assert (= bv_45 (bvand bv_23 bv_17)))
(assert (= bv_46 (bvsub bv_23 bv_37)))
(assert (= bv_47 (bvxor bv_1 bv_11)))
(assert (= bv_48 (bvxor bv_6 bv_36)))
(assert (= bv_49 (bvor bv_0 bv_9)))
(assert (= bv_50 (bvand bv_9 bv_48)))
(assert (= bv_51 (bvult bv_11 bv_32)))
(assert (= bv_52 (bvnot bv_3)))
(assert (= bv_53 (bvsub bv_16 bv_18)))
(assert (= bv_54 (bvlshr bv_20 bv_42)))
(assert (= bv_55 (bvsge bv_26 bv_18)))
(assert (= bv_56 (bvslt bv_30 bv_24)))
(assert (= bv_57 (bvlshr bv_54 bv_35)))
(assert (= bv_58 (bvadd bv_11 bv_8)))
(assert (= bv_59 (bvand bv_15 bv_57)))
(assert (= bv_60 (bvshl bv_26 bv_43)))
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
(assert (= z_0 (= bv_29 bv_8)))
(assert (= z_1 (= bv_21 bv_24)))
(assert (= z_2 (= bv_12 bv_4)))
(assert (= z_3 (= bv_58 bv_11)))
(assert (= z_4 (= bv_37 bv_15)))
(assert (= z_5 (= bv_16 bv_2)))
(assert (= z_6 (= bv_53 bv_19)))
(assert (= z_7 (= bv_59 bv_3)))
(assert (= z_8 (= bv_43 bv_44)))
(assert (= z_9 (= bv_34 bv_55)))
(assert ( or ( or ( or z_5 z_1 ) ( and z_4 ( or ( or ( or z_8 z_6 ) z_3 ) ( and z_9 z_2 ) ) ) ) ( and z_0 z_7 ) ) )
(check-sat)
(get-model)
(exit)
