(set-logic QF_BV)
(set-option :produce-models true)
(declare-const bv_0 (_ BitVec 256))
(declare-const bv_1 (_ BitVec 256))
(declare-const bv_2 (_ BitVec 256))
(declare-const bv_3 (_ BitVec 256))
(declare-const bv_4 (_ BitVec 256))
(declare-const bv_5 (_ BitVec 256))
(declare-const bv_6 (_ BitVec 256))
(declare-const bv_7 (_ BitVec 256))
(declare-const bv_8 (_ BitVec 256))
(declare-const bv_9 Bool)
(declare-const bv_10 (_ BitVec 256))
(declare-const bv_11 Bool)
(declare-const bv_12 (_ BitVec 256))
(declare-const bv_13 (_ BitVec 256))
(declare-const bv_14 (_ BitVec 256))
(declare-const bv_15 (_ BitVec 256))
(declare-const bv_16 (_ BitVec 256))
(declare-const bv_17 (_ BitVec 256))
(declare-const bv_18 (_ BitVec 256))
(declare-const bv_19 Bool)
(declare-const bv_20 (_ BitVec 256))
(declare-const bv_21 (_ BitVec 256))
(declare-const bv_22 (_ BitVec 256))
(declare-const bv_23 (_ BitVec 256))
(declare-const bv_24 (_ BitVec 256))
(declare-const bv_25 Bool)
(declare-const bv_26 (_ BitVec 256))
(declare-const bv_27 (_ BitVec 256))
(declare-const bv_28 Bool)
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
(declare-const bv_49 Bool)
(declare-const bv_50 (_ BitVec 256))
(declare-const bv_51 (_ BitVec 256))
(declare-const bv_52 (_ BitVec 256))
(declare-const bv_53 (_ BitVec 256))
(declare-const bv_54 (_ BitVec 256))
(declare-const bv_55 (_ BitVec 256))
(declare-const bv_56 (_ BitVec 256))
(declare-const bv_57 (_ BitVec 256))
(assert (= bv_2 (bvlshr bv_1 bv_0)))
(assert (= bv_3 (bvneg bv_0)))
(assert (= bv_4 (bvneg bv_1)))
(assert (= bv_5 (bvxor bv_3 bv_0)))
(assert (= bv_6 (bvnot bv_1)))
(assert (= bv_7 (bvand bv_3 bv_1)))
(assert (= bv_8 (bvlshr bv_3 bv_4)))
(assert (= bv_9 (bvult bv_1 bv_8)))
(assert (= bv_10 (bvadd bv_2 bv_4)))
(assert (= bv_11 (bvsle bv_4 bv_5)))
(assert (= bv_12 (bvadd bv_3 bv_2)))
(assert (= bv_13 (bvand bv_3 bv_10)))
(assert (= bv_14 (bvshl bv_10 bv_6)))
(assert (= bv_15 (bvand bv_8 bv_6)))
(assert (= bv_16 (bvadd bv_2 bv_3)))
(assert (= bv_17 (bvlshr bv_15 bv_8)))
(assert (= bv_18 (bvsub bv_13 bv_16)))
(assert (= bv_19 (bvsgt bv_3 bv_15)))
(assert (= bv_20 (bvor bv_18 bv_8)))
(assert (= bv_21 (bvneg bv_0)))
(assert (= bv_22 (bvadd bv_3 bv_20)))
(assert (= bv_23 (bvor bv_15 bv_12)))
(assert (= bv_24 (bvshl bv_21 bv_17)))
(assert (= bv_25 (bvugt bv_16 bv_13)))
(assert (= bv_26 (bvxor bv_2 bv_21)))
(assert (= bv_27 (bvshl bv_3 bv_26)))
(assert (= bv_28 (bvule bv_7 bv_14)))
(assert (= bv_29 (bvand bv_24 bv_0)))
(assert (= bv_30 (bvlshr bv_1 bv_14)))
(assert (= bv_31 (bvshl bv_21 bv_6)))
(assert (= bv_32 (bvlshr bv_2 bv_16)))
(assert (= bv_33 (bvxor bv_24 bv_23)))
(assert (= bv_34 (bvadd bv_23 bv_33)))
(assert (= bv_35 (bvand bv_33 bv_34)))
(assert (= bv_36 (bvsrem bv_34 bv_18)))
(assert (= bv_37 (bvmul bv_20 bv_21)))
(assert (= bv_38 (bvneg bv_17)))
(assert (= bv_39 (bvxor bv_2 bv_35)))
(assert (= bv_40 (bvand bv_10 bv_7)))
(assert (= bv_41 (bvand bv_16 bv_4)))
(assert (= bv_42 (bvudiv bv_36 bv_3)))
(assert (= bv_43 (bvor bv_4 bv_21)))
(assert (= bv_44 (bvlshr bv_4 bv_34)))
(assert (= bv_45 (bvadd bv_21 bv_0)))
(assert (= bv_46 (bvneg bv_0)))
(assert (= bv_47 (bvneg bv_17)))
(assert (= bv_48 (bvsub bv_42 bv_7)))
(assert (= bv_49 (bvule bv_35 bv_5)))
(assert (= bv_50 (bvneg bv_44)))
(assert (= bv_51 (bvnot bv_12)))
(assert (= bv_52 (bvneg bv_12)))
(assert (= bv_53 (bvxor bv_12 bv_14)))
(assert (= bv_54 (bvnot bv_21)))
(assert (= bv_55 (bvshl bv_42 bv_2)))
(assert (= bv_56 (bvneg bv_23)))
(assert (= bv_57 (bvxor bv_23 bv_51)))
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
(assert (= z_0 (= bv_47 bv_33)))
(assert (= z_1 (= bv_41 bv_31)))
(assert (= z_2 (= bv_27 bv_38)))
(assert (= z_3 (= bv_24 bv_36)))
(assert (= z_4 (= bv_23 bv_48)))
(assert (= z_5 (= bv_18 bv_51)))
(assert (= z_6 (= bv_16 bv_44)))
(assert (= z_7 (= bv_43 bv_26)))
(assert (= z_8 (= bv_34 bv_50)))
(assert (= z_9 (= bv_57 bv_56)))
(assert ( or ( or ( or ( or z_8 z_7 ) ( and z_2 z_1 ) ) ( not ( or ( and z_3 z_6 ) ( and z_0 z_9 ) ) ) ) ( and z_5 z_4 ) ) )
(check-sat)
(get-model)
(exit)
