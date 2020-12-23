Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.57])
 by mx.groups.io with SMTP id smtpd.web10.8592.1608729064048922370
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Dec 2020 05:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WHSmnh96;
 spf=pass (domain: windriver.com, ip: 40.107.92.57, mailfrom: ovidiu.panait@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niFSMfwE7KP0puiKdvlYJz9QUsWNahfkq1aGN2VrE1JPqGZDmVwvyOZgmMelDAf3huev403TXUqxjzGkv82QVTi9dC4uY0U73G3cxS4XhRr2fMOo5+B13ZWxW/f7nUBCuT4EQe4/Pd3ckuWFF27bEDT1qBAah3KBIN976fUpRdVmnWX59tCsJQud3eMPaWB+tH6XhybLogQP99LrO9ypDsTpbtH06C7BHxIAHtjVWQe63LJM0lpd3hQtX5xgwxhwWXvUivHc4inMhdSeq+hLA9iJY/MPvdioqhxQqh2+F2i2WqvXU7YGz7PLszebll0JVBDmFgt/BRIpTFfy0JEmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC/MLvekUfT7yWbT29z248TtMY01wTuLmNj8BwTKKj8=;
 b=P3Z/9YW+hijf06dCiTZqkvVwN1ubhY7+yF3p4+/gNKfuHItLyxpKMidaAltCN7TAhXMbdiGvhyI1cNx0b5jaOSoB0qVvEC+pAh8Ua8S1BM9RJ/cjysKXt1UU4JBGYxJcJsTkzg8I+xdL6rpT3+rCn849p+6EvN9k+YN15TWWegnuy1OIU3gjeeSypzb72vDuRtIjYDBv5GXGfqcDtYAEfqUCCD5Ua3AoPDQc2nPsCWN4u5CkJR8e8ywxmbhlpQdnqKfzL0Wy+zrOZxsqFiqIoAqzkMjBPaQiHS2b07v2c03SOiMRB+DfZn4DssA1m/+YcU3TNKEZkQexg7PAUz9jNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC/MLvekUfT7yWbT29z248TtMY01wTuLmNj8BwTKKj8=;
 b=WHSmnh96wiet0ynISiVp1oaJtbSu6VP8U6y7jyZXM4+GWD10HxDzRW1NjLfV8t+XXSfZLF9lLyUzdWfu1MfL5ZKNXShkccOdGGJsSVHX8yy9mK7jxwsXi4WZxFnPbhEUQvfO6G5izaMcxa0J7eo7DU0HNWOSij88qSeniZCI1vg=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3201.namprd11.prod.outlook.com (2603:10b6:208:6b::21)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Wed, 23 Dec
 2020 13:11:02 +0000
Received: from BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43]) by BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43%5]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 13:11:02 +0000
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] variables: Document KERNEL_DTC_FLAGS variable
Date: Wed, 23 Dec 2020 15:09:38 +0200
Message-Id: <20201223130938.20476-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR07CA0160.eurprd07.prod.outlook.com
 (2603:10a6:802:16::47) To BL0PR11MB3201.namprd11.prod.outlook.com
 (2603:10b6:208:6b::21)
Return-Path: ovidiu.panait@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-linux01.wrs.com (46.97.150.20) by VI1PR07CA0160.eurprd07.prod.outlook.com (2603:10a6:802:16::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.22 via Frontend Transport; Wed, 23 Dec 2020 13:11:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9662e020-6792-4451-3b02-08d8a7443314
X-MS-TrafficTypeDiagnostic: MN2PR11MB4567:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4567F675DCE48979A12DF2ECFEDE0@MN2PR11MB4567.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4hcQzlBkRKXQiwI1hR0gmBu6GS/TKsk/sVtkvhQvjxFY6HmP40Wc+cEdQjKyUHoSl0fSXvwy3qxkDxtDe9v9e0WVGJPikp01P7od9lSD26D35TwNcIa12Mz1CWH30d5UngYeGiZjpC3SXj2xAwFQqmXqWnICb8WfPJiPkqY4qka5O0vLirtb9iSyOGDMDGT5hbQuINn5Pu0+ZfgeB1ansb7xUJV6Ct9kfK33yYV486cN1fGO78WzKBAoGhgd2s/Qg6AuK2LY2Up8j0R7Y14NEV5EElGCmpNTiuWwNtatPjlvyOCpHwfKAoZbPPzskuhlkn9Yw7NHH/SyZS/rxi+w09rZoTRf2dw5SjyG7VgGQCv9cUQ8ruunUNzyl8aBp+ABg9l8gDARjPTY/LMuayYc0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(396003)(366004)(136003)(26005)(8676002)(6512007)(36756003)(44832011)(2616005)(6666004)(956004)(316002)(2906002)(6506007)(1076003)(66476007)(186003)(16526019)(478600001)(52116002)(66946007)(5660300002)(86362001)(6486002)(83380400001)(6916009)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?GJR4f3uFZ+rDR9wmZkyhdQdeZajSW6YX1TB25OQO/Cvyn8mi2r1sl+4itRuO?=
 =?us-ascii?Q?p+MJzYQQPfRjIe8UHjekl2wq6TBy0vIsXyKe863/1G7KVH+doR6VBhMW9s8Y?=
 =?us-ascii?Q?Ct32t5h9H+iAONUt3jDjSJmjaITbvcPeER7UP7Kj1hAMmOwWEPac5M3xv10+?=
 =?us-ascii?Q?6jq/CWLZG2ZLzEL+S1dh9kwsJLGWxY5beoa8Z+OSiQbFdmb0K0TdgodipfY0?=
 =?us-ascii?Q?owaxDwBSZRzM+oTjIJxWEMizdCAOOMnBLvCfqpejD2s5NLlz+GDodrI7u1rb?=
 =?us-ascii?Q?FJAieTuBomz1fmpQrUmNFnrangaXQnMhZlcoDDpaV5gJM7h5nZj+Vdp/Tn+J?=
 =?us-ascii?Q?H0X/xOpaBtc8MElgV4KiwZVxQ2p4ktpEG48yMdrmc3NfWzTWA8N5OAS7yGqh?=
 =?us-ascii?Q?ZTBTQDPcja9CIXG7Bu4ERmzrz+q8Zz8QtA23FrSfmKBZST6xFIuH8wKDN1/7?=
 =?us-ascii?Q?O8pPWAXEZYA5nVQPS1XU9/sPnziVoA2DNCMcLJR772B+/ziZMfXmtnTkXjwA?=
 =?us-ascii?Q?uJBpW5VUUI7JeXuXh2hiILAmYcwXTMW+8+pthf9y678114wDk1YAA4IYWbnu?=
 =?us-ascii?Q?pBfAaLHEocB+v21Hvhevmih+L58yo6nL+F8PJrU2JSQcF2s79rZU5GkAWIw4?=
 =?us-ascii?Q?TG3pk8/PHz7HEtRXkocg7ARLfVbLXLGcEA9AKky/zzuHYRrdngAZAgcCqXc1?=
 =?us-ascii?Q?ihVUNcGdfKpvybCCrYM04EZ7zAXUbUxfn98yIeechiz2LfkD+fGjq2qEqOfs?=
 =?us-ascii?Q?0xFTqmDRQDGdFu2f6Fqt9KtEVEeA8cSDE5plN71DSXwyL9g+DY1c3BACkV2z?=
 =?us-ascii?Q?VZvL6rbn89XwhNjw4d/di84DoqAByPIgr6dhvod8F3CLJAWbtn39rvMC/PS+?=
 =?us-ascii?Q?jjb/NcqkOUrk7nzrOad5GaG6yhA3685cSH4pTuiDapsddzMJuOZzGMmMh7g4?=
 =?us-ascii?Q?aTM/qu1wZ4CMpP6Se3Q6oK23IcObWavyzOOF+2YQiww=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 13:11:02.9203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 9662e020-6792-4451-3b02-08d8a7443314
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tynTbTRUlRr9sH3N1zOn9VezIoPzywZ5yFJpAL7yQZrqQoz6gGzx94yrytBWyI/5mh6zGJK9MOMJHqAaOK5KBFr+szNpfw0b7D/Zjx071/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
Content-Type: text/plain

Add documentation for the newly introduced KERNEL_DTC_FLAGS variable.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8c6cc46b6..a4938d9c5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3838,6 +3838,14 @@ system and gives an overview of their function and contents.
       :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
       be inherited.
 
+   :term:`KERNEL_DTC_FLAGS`
+      Specifies the dtc flags that are passed to the Linux kernel build system
+      when generating the device trees (via DTC_FLAGS environment variable).
+
+      In order to use this variable, the
+      :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
+      be inherited.
+
    :term:`KERNEL_DTB_LINK_NAME`
       The link name of the kernel device tree binary (DTB). This variable
       is set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
-- 
2.17.1

