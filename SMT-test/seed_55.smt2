(set-logic QF_BV)
(set-option :produce-models true)
(declare-const bv_0 (_ BitVec 256))
(declare-const bv_1 (_ BitVec 256))
(declare-const bv_2 Bool)
(declare-const bv_3 (_ BitVec 256))
(declare-const bv_4 (_ BitVec 256))
(declare-const bv_5 (_ BitVec 256))
(declare-const bv_6 (_ BitVec 256))
(declare-const bv_7 (_ BitVec 256))
(declare-const bv_8 (_ BitVec 256))
(declare-const bv_9 (_ BitVec 256))
(declare-const bv_10 (_ BitVec 256))
(declare-const bv_11 Bool)
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
(declare-const bv_31 (_ BitVec 256))
(declare-const bv_32 (_ BitVec 256))
(declare-const bv_33 (_ BitVec 256))
(declare-const bv_34 (_ BitVec 256))
(declare-const bv_35 (_ BitVec 256))
(declare-const bv_36 (_ BitVec 256))
(declare-const bv_37 (_ BitVec 256))
(declare-const bv_38 (_ BitVec 256))
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
(declare-const bv_51 (_ BitVec 256))
(declare-const bv_52 (_ BitVec 256))
(declare-const bv_53 (_ BitVec 256))
(declare-const bv_54 (_ BitVec 256))
(declare-const bv_55 (_ BitVec 256))
(declare-const bv_56 (_ BitVec 256))
(declare-const bv_57 (_ BitVec 256))
(declare-const bv_58 Bool)
(declare-const bv_59 (_ BitVec 256))
(declare-const bv_60 (_ BitVec 256))
(declare-const bv_61 (_ BitVec 256))
(assert (= bv_2 (bvule bv_1 bv_0)))
(assert (= bv_3 (bvnot bv_1)))
(assert (= bv_4 (bvsub bv_0 bv_3)))
(assert (= bv_5 (bvshl bv_3 bv_0)))
(assert (= bv_6 (bvand bv_5 bv_3)))
(assert (= bv_7 (bvxor bv_5 bv_4)))
(assert (= bv_8 (bvsub bv_1 bv_7)))
(assert (= bv_9 (bvnot bv_5)))
(assert (= bv_10 (bvneg bv_3)))
(assert (= bv_11 (bvule bv_3 bv_0)))
(assert (= bv_12 (bvsrem bv_6 bv_5)))
(assert (= bv_13 (bvlshr bv_10 bv_9)))
(assert (= bv_14 (bvudiv bv_8 bv_6)))
(assert (= bv_15 (bvand bv_12 bv_7)))
(assert (= bv_16 (bvor bv_7 bv_12)))
(assert (= bv_17 (bvmul bv_7 bv_0)))
(assert (= bv_18 (bvsub bv_6 bv_1)))
(assert (= bv_19 (bvlshr bv_17 bv_6)))
(assert (= bv_20 (bvlshr bv_8 bv_1)))
(assert (= bv_21 (bvsub bv_14 bv_7)))
(assert (= bv_22 (bvxor bv_0 bv_8)))
(assert (= bv_23 (bvxor bv_1 bv_5)))
(assert (= bv_24 (bvlshr bv_23 bv_12)))
(assert (= bv_25 (bvsub bv_0 bv_1)))
(assert (= bv_26 (bvsrem bv_12 bv_14)))
(assert (= bv_27 (bvsgt bv_13 bv_20)))
(assert (= bv_28 (bvneg bv_8)))
(assert (= bv_29 (bvand bv_23 bv_1)))
(assert (= bv_30 (bvsub bv_22 bv_3)))
(assert (= bv_31 (bvxor bv_23 bv_24)))
(assert (= bv_32 (bvor bv_12 bv_15)))
(assert (= bv_33 (bvlshr bv_19 bv_3)))
(assert (= bv_34 (bvshl bv_12 bv_23)))
(assert (= bv_35 (bvshl bv_33 bv_9)))
(assert (= bv_36 (bvxor bv_35 bv_22)))
(assert (= bv_37 (bvlshr bv_20 bv_22)))
(assert (= bv_38 (bvor bv_21 bv_12)))
(assert (= bv_39 (bvneg bv_13)))
(assert (= bv_40 (bvlshr bv_5 bv_6)))
(assert (= bv_41 (bvshl bv_14 bv_28)))
(assert (= bv_42 (bvxor bv_35 bv_8)))
(assert (= bv_43 (bvshl bv_3 bv_24)))
(assert (= bv_44 (bvnot bv_13)))
(assert (= bv_45 (bvnot bv_13)))
(assert (= bv_46 (bvadd bv_30 bv_37)))
(assert (= bv_47 (bvlshr bv_1 bv_35)))
(assert (= bv_48 (bvsub bv_8 bv_37)))
(assert (= bv_49 (bvor bv_43 bv_1)))
(assert (= bv_50 (bvshl bv_7 bv_20)))
(assert (= bv_51 (bvurem bv_37 bv_15)))
(assert (= bv_52 (bvneg bv_26)))
(assert (= bv_53 (bvnot bv_18)))
(assert (= bv_54 (bvor bv_33 bv_18)))
(assert (= bv_55 (bvmul bv_7 bv_44)))
(assert (= bv_56 (bvshl bv_39 bv_4)))
(assert (= bv_57 (bvshl bv_52 bv_47)))
(assert (= bv_58 (bvsle bv_15 bv_52)))
(assert (= bv_59 (bvlshr bv_17 bv_26)))
(assert (= bv_60 (bvsrem bv_20 bv_49)))
(assert (= bv_61 (bvurem bv_4 bv_42)))
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
(assert (= z_0 (= bv_42 bv_6)))
(assert (= z_1 (= bv_61 bv_16)))
(assert (= z_2 (= bv_49 bv_34)))
(assert (= z_3 (= bv_30 bv_28)))
(assert (= z_4 (= bv_26 bv_47)))
(assert (= z_5 (= bv_17 bv_39)))
(assert (= z_6 (= bv_40 bv_3)))
(assert (= z_7 (= bv_53 bv_43)))
(assert (= z_8 (= bv_12 bv_52)))
(assert (= z_9 (= bv_14 bv_24)))
(assert ( and ( or ( and ( and z_1 z_3 ) z_5 ) z_2 ) ( or ( or z_4 ( or ( and z_9 z_6 ) z_8 ) ) ( or z_0 z_7 ) ) ) )
(check-sat)
(get-model)
(exit)
