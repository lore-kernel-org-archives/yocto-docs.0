Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.62])
 by mx.groups.io with SMTP id smtpd.web09.14040.1609770626119590890
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 06:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LYv+VTc7;
 spf=pass (domain: windriver.com, ip: 40.107.237.62, mailfrom: ovidiu.panait@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KC7xQDj/PEpqpxKWeyS4Ov1g0OvNxCxDrn0rcG49RSOJX+UVd5c9bwve7JcX47oDg1dWmxfjFMb8K4dlRlrcnWfpadgZXgk3E5fOm6TCYCf2QvvmRqdv38AyPe3ZKKt36W5umqBBEqIdf7gWzq8PFwfhh7g4PO6qI42EO70oSv4mUMjcCTy1tmRqxB1sGV3nRjhDM1Ip2VHXHFIovZY1X5vQNE5N1Mx1Xjdj6Cs9gjVPw2oj4SYz6KxnvFknAvnaRCmr8YL2a0jTUQc7dNl/oxQi7z1HVJMtCcE64S+VcxTzW5Ym4ASqWXRmWSYBK+uOnYxux8KufegJbWk+LrzCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNle6rfJ3luX4bi2/n+Sz5Ngj3f+v9e01O1I+e8kLX0=;
 b=f7Ba9pd5LIDnOcClXkGMYan2ZzcbEddlq3n5XZNDnP06elijDT1LOHshQXfel6sdUO6oqvo6t/lTuZBJLIfZkUWYNx9sW2nd2oKcfV9K80jRWpBVwvXGRLsWRVom1mtnTIyh1ULO62a38RXxufJTcEyzFwTElZo34Ssqu1KCGLc3gw9ebNxTY0bgWaC8dLxeDLGxoZI8UKxPrvFLngRBzfKJ+iMkrQvOD5nZrtZgeDhsU/hgneAHdA2OpVX8dEeboHZ1qFkFgETCOuplSuaFNXgb/1XmWYHGPyEomNWFctaprdKTxi95a1Ki2TvyYFyI12HOFaHgA0dB3rRWIfDVQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNle6rfJ3luX4bi2/n+Sz5Ngj3f+v9e01O1I+e8kLX0=;
 b=LYv+VTc7Y50SRLIZMPvqDKYR6UpmQ3ySniGhNkUepNq0MBohzdAQva3i6S4CjW152eoRsMpt2SGH90yWJjI9381v6EpgEkiF20jh/5KttNHPL5L9HIP8rYT8FKKmG2Dcfeo708PAbSbnCwav6sVGB/i6N5QiFadp4TkOWtGhLVA=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3201.namprd11.prod.outlook.com (2603:10b6:208:6b::21)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Mon, 4 Jan
 2021 14:30:24 +0000
Received: from BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43]) by BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43%6]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 14:30:23 +0000
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3] variables: Add documentation for KERNEL_DTC_FLAGS
Date: Mon,  4 Jan 2021 16:28:51 +0200
Message-Id: <20210104142851.6696-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR09CA0109.eurprd09.prod.outlook.com
 (2603:10a6:803:78::32) To BL0PR11MB3201.namprd11.prod.outlook.com
 (2603:10b6:208:6b::21)
Return-Path: ovidiu.panait@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-linux01.wrs.com (46.97.150.20) by VI1PR09CA0109.eurprd09.prod.outlook.com (2603:10a6:803:78::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Mon, 4 Jan 2021 14:30:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f514a41-a48a-4e5f-1edc-08d8b0bd45ca
X-MS-TrafficTypeDiagnostic: MN2PR11MB4567:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB456737A1ACC292496BAF0B04FED20@MN2PR11MB4567.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EMxx+7gx9QX6QMum7n/tQJlLEdD1b59d2IsXdFLYC6w5easZYH2sCx4kJPsu/tviWJ4QlTxWASHanCASFuVWLrihvwADQy7yz1kMmsry8SUoC6/3EzCd2RP8qyU44y0Wb5qpfyezlsWO74YxcepPa8ZD6qF8nW+6ejkHNN1Rwi9yj6Qb/7SjzuDyWlR7Hv5MH9ZHrNU1H+s0HKOVg9wZDp3ARoSotLxs6EGMpjoDdK1164keDWvxLpQNIR3B2tf8ctSapTAGxsRPvT8qQXCrZV6DYgbB3c3+MSLNibp7GgzLvXoCaI16HxQeSUyOuyRPDrzkxGFG4lqOJMm9zk1QWk9hhOJXYg6wFs2mCxLQRKOhzvExSiKrj4xR7mNqI7na1PP5HwGwhM5W1GDeMYGSrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(366004)(396003)(376002)(26005)(316002)(36756003)(1076003)(6916009)(8676002)(6506007)(52116002)(2906002)(86362001)(6666004)(2616005)(6486002)(5660300002)(16526019)(6512007)(956004)(66556008)(66946007)(66476007)(186003)(44832011)(83380400001)(478600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?1AY5m3dPMRR2uJEOkq6eJ89qLt8GdJOuoqYM3I2j7GO8wcATKMxz6AcVjzha?=
 =?us-ascii?Q?hgOrlw2V15iMAiViTK/BEbw79LuvwoflEOMoSH/hb7WQb3H+Tcz48DwYOptc?=
 =?us-ascii?Q?bF+VkZ7ltTUo9/u+7xcI1B2HLCGGEu3Bi3fiVBQ5tE/X6umUp4bAkYVQcPpb?=
 =?us-ascii?Q?QB8adlXtcOTrswUW4NN0rj2NkU+zxsN7Ad4u+86hEoOD0iDTE56dkLT9r63y?=
 =?us-ascii?Q?zxO/ECI5U7PzVXgbA/hEbSBDCapGOsLZ53AKtm9WKmPyb5QNPxgYx4nRU+wa?=
 =?us-ascii?Q?yyH0x4NCGMaZUv+uI9v6X81pJEOKmkJjKcwv/CNuvnCK5PfrxpK1r3Ame64m?=
 =?us-ascii?Q?AgtrIOyR6iqGUP2oWccpTvQ2D7dggHZkPzs9sPYb+TgXzlC2bxVuBjObNbJD?=
 =?us-ascii?Q?cDWpKx0V2PypFvvGrEvYOhMg383/nWHiyVQuiRtC2GrY8oPX7UyXpHgFRfro?=
 =?us-ascii?Q?nMpgJzL+qfvSOYu8Ix8K5vfv9qYCwT59Q9fq9iPK0SzNR0RtbNF2v45xzo3L?=
 =?us-ascii?Q?SmmGKnAhGJNn/cAnRYtdCsFBOVw40Za7O+Jmtwi4xa1MZqEGs6Vt9R/Q8pq+?=
 =?us-ascii?Q?HEAxHAulcj8CZuRZQe8v3qDLvVRNr6u0cq4UKopyGiFz/VADrJcq1ligBHz7?=
 =?us-ascii?Q?dfCp96vy/vHgR2ntAHdvd0mgV+ZJHfLT4KYCgyEU5FptwkkDlIZNDBqBdRXt?=
 =?us-ascii?Q?u6SfZQmh32wOujFBvqnscBqpFNDsnVZHTpfX5zGa/vMconpDuTdgtaN4krYc?=
 =?us-ascii?Q?gKsSJO1IhXhkwWecbSqv8Y0udPqXkVkF2gNa9ofuLlv3odwg+fq4OcdhCKWY?=
 =?us-ascii?Q?H403jR4djzKmr+1a5OB0bRmXB9TP+NzoWeuV5lnyhpG9EVUL6KR5EO5HRu80?=
 =?us-ascii?Q?7pZX2SukyvRF/oSdNIdjyufDu+blWlQWbaAGNKpqMf/BOpyMXsEexpc7E2pR?=
 =?us-ascii?Q?JyZ0/4kFV7UaQIWvlHxp/yk8YMKZ1WuwlFueQUu07+g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 14:30:23.7787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f514a41-a48a-4e5f-1edc-08d8b0bd45ca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RXI1j8Xg4nD1+f/Kj4slSJErNXC/2BO6kBHQws9yYxxVXKDPR9gg7CcdgTuo2sKZ2/WyRu1wWIGIvGITNJhOJfgWNKpXYLpiZ9yKgMctbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
Content-Type: text/plain

Add documentation for the newly introduced KERNEL_DTC_FLAGS variable.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
v3 updates:
- highlight ``DTC_FLAGS`` and ``dtc``

 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c8e28fd32..4ce264813 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3884,6 +3884,15 @@ system and gives an overview of their function and contents.
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
+   :term:`KERNEL_DTC_FLAGS`
+      Specifies the ``dtc`` flags that are passed to the Linux kernel build
+      system when generating the device trees (via ``DTC_FLAGS`` environment
+      variable).
+
+      In order to use this variable, the
+      :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
+      be inherited.
+
    :term:`KERNEL_EXTRA_ARGS`
       Specifies additional ``make`` command-line arguments the OpenEmbedded
       build system passes on when compiling the kernel.
-- 
2.17.1

