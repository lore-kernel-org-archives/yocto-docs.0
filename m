Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.61])
 by mx.groups.io with SMTP id smtpd.web09.11401.1609754186494016876
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 01:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GB8q2PTG;
 spf=pass (domain: windriver.com, ip: 40.107.236.61, mailfrom: ovidiu.panait@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJA+canDzQS4vJihNk/6gkELzKOLJQoOqSYp+v6sO94FSdy1D4NgSExVZO9jigQ/3OXEu/Dybasx3aUK+FUYXiL+TLtL6f51l90jKwh7ncxSHgHP8tkUQXsKK91nHSk5PPzYiyMHjwfKw7YUlN081eAMnnslN7lX8gVNaOvPIaUcOJ/WCwN3P/178ozjhsAMrSPdVx09EbHf6HbiQXo4wAKgJqbiAlRzhryp6WWC9SM6qPGEaBSaqpl/GoTo+5RwUJuCWqWsDseFLVReEdqZCAiyPcU1KvT9U2Cy0xRGoyqehvEjhWcF8zwAvIar+y2EmYjK1gWn1dmdHFbj48zPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfKDjEtSHkZ4im9lPz2tW2ZkK1Nv6VnZL7c23Lqn/Fg=;
 b=UQlveBtqyq/XsFEy3MqUFJnjWFcDaw3pwxbJ573oyUlyrrbFn7lGqYp60mhkd1eBx4Mg2RLN94rSPQJWCmED4f0kBk6Pbr7Vcn3FqKsK7qBOE/5D/MWMZ/8tAAM5XLIwq0fdhNCfmFDep6xg96iK2KTLHDHeHIEMHb6wT0hQOqoVeRDKfrXZP1fDO+NJXGGIYnnpi2A2MiF1t3nW93fIjlaAbFtEdpY1uXEBSzkMSJKHv0z5FOtVmsY2qY9evhZ9uzEYQ2UWMWG5Iu+t1owyY1i5Av1NzCBJxAg4ipQpiziJk6G9SnSKPmd/qGAs0bywXCFz+wZzG5Bxrv2JFga4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfKDjEtSHkZ4im9lPz2tW2ZkK1Nv6VnZL7c23Lqn/Fg=;
 b=GB8q2PTGJD9r+aY89CurLa0Qcz0wotAeTmSVmRpeVBeNHACB/uChN6GL30K0lO0CRw830D7q7qlvPLeV/rf9hbuQLX44eSHkZ7calfjN3kYXvMbb2koQ41DOZJLUtl4GFTFednwmQKY6sfFWZfiI13LxQzpCq6c6V++i+fR9iDQ=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3201.namprd11.prod.outlook.com (2603:10b6:208:6b::21)
 by BL0PR11MB3410.namprd11.prod.outlook.com (2603:10b6:208:33::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Mon, 4 Jan
 2021 09:56:24 +0000
Received: from BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43]) by BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43%6]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 09:56:24 +0000
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] variables: Add documentation for KERNEL_DTC_FLAGS
Date: Mon,  4 Jan 2021 11:54:53 +0200
Message-Id: <20210104095453.33977-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR09CA0103.eurprd09.prod.outlook.com
 (2603:10a6:803:78::26) To BL0PR11MB3201.namprd11.prod.outlook.com
 (2603:10b6:208:6b::21)
Return-Path: ovidiu.panait@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-linux01.wrs.com (46.97.150.20) by VI1PR09CA0103.eurprd09.prod.outlook.com (2603:10a6:803:78::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Mon, 4 Jan 2021 09:56:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4406f876-5ee1-4ac5-cdb4-08d8b096fee0
X-MS-TrafficTypeDiagnostic: BL0PR11MB3410:
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB34101BB4C2E1F3C273DB3E18FED20@BL0PR11MB3410.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YL53DKayQOR1BRbtdbtfeDr1CIUJFtO5Yc93bAqk550vLpeqDayABjAOWn7L3RiFcQ5cCg2g9pccTlmSzQH9NEEezNJ4XjcOnpjYFR773pMj4l7375kF4PkFXvIIETj9GHt9AIz8rMNqTLGfCvBRZsrV6fHXU8bMLL2BX8qf4P2w6hssR1LHtqlU8kMlO+ztohZ9vM7t/eujnrbMaxNkL9NAFG6zm4mtP4ETDwbiV7qOkeaCaxFzq0QotDFRL/PnLXTVAoC8dSFCOf8Z6LexVw/Bw6dIM68RdVZxePpwDjuskdoQlktXaaCWamfb0z/kbjDo0p9Btl3ZSusI2QjlgM2S1MkQ7HDfUJMCpm1PUJ2VUKedNAV8pUBjyBsse1+t/+34BNNqkSXRHL/+gHJjnQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39840400004)(396003)(136003)(366004)(956004)(2616005)(26005)(6486002)(8936002)(6512007)(44832011)(86362001)(66556008)(66476007)(66946007)(6666004)(83380400001)(6916009)(2906002)(478600001)(186003)(16526019)(1076003)(52116002)(5660300002)(36756003)(8676002)(316002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?XYYa1r4fa13LYvRWEaDo2IBKw++K8cIhSGWYqldEPSv8yc46bTqWmvdOfXJe?=
 =?us-ascii?Q?3pkZcftRfYKKt042yv/OBMYF6syoxHePtc3f9HyMJsRKwPTJE//vfOAnYIpN?=
 =?us-ascii?Q?irox2I1gmoCjZ8fv7xTF7iV9Io49pvBr+lrMAZQWhJefnuKHD1M9ZsagKbRv?=
 =?us-ascii?Q?H7nv1psO/C56T0SIGIlBXFIjzqOsxjZUQfyp0NHUpWJxyLkUUtNQToG3MmGe?=
 =?us-ascii?Q?FXiBt4G+QRQdhmWPHXn9Yq/mtbh0dVE4i8iXGMGroP0HD5V7d7/SbqXq2vzt?=
 =?us-ascii?Q?w5U6VOk9Fjgl0qIxp4JgNMlqKrG1XTLsdANi3YzGgyxSjE46WMk9ylrDaB4m?=
 =?us-ascii?Q?0AQ1HVzJhdKhAQXj4cKZ2JxEkJ6CykCTZEecQsDtRkbrhGjW1V88UC63hibU?=
 =?us-ascii?Q?rE4Hj37zkq2CvEiCG2ZHulH5MezJY4EmEsymRVoaQYUI60Xh1P/CrDpP1qm0?=
 =?us-ascii?Q?WUYMwaMH0KvwdzUWY31Iwzq30ZluxdCCpQ9Gkj2+dK59gzZ2/OouLoS50cM9?=
 =?us-ascii?Q?8Z474lfaQbOiPuwnKHd8lg6xhOboC5pDGyrFoIo4Zu/GDosSQcZuVkjqiCcQ?=
 =?us-ascii?Q?VmofIW5MS+RMPlCbvFSfd+xuzxeMB4GNSmwsJocpJ7xzk8rbYYX0nnavvs3o?=
 =?us-ascii?Q?2qOgxFpQkTucRnRj0Kpmtx8n/pntn5BAFycgaC1BNsMQaDbSsPbB39rG6AmM?=
 =?us-ascii?Q?I7UmIH+t9qdQgow8AzPH8uzO+lyTg4lFBtPmGVV0RjTWSW22lH8MkgnWxuTD?=
 =?us-ascii?Q?9ktf5mkFf5L7wO5XVKqvLdUlxcJ8+yoOUTFDtauEQCUSiuAoNRv82L94+4Ek?=
 =?us-ascii?Q?35f6xHN2TF1nC4BAC9ocnVZzZr26zXn+ZYJTZR+v2TOSx5CVwNrygqm1WBgR?=
 =?us-ascii?Q?M/lp+hJ1edhvv8BTe0zbFcipK0sa4b/QGADS9pnFiM4DnBbizW7Ut2ZILcjX?=
 =?us-ascii?Q?dW/MM2WxM8TaTQuVncB/tPf2mtzFamZzNppOw7WTeGo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 09:56:23.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 4406f876-5ee1-4ac5-cdb4-08d8b096fee0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwQxuq8/pnGQ93K0uoNLqmKRO2MujaXfLgq5Drjki/vBHJcD+fIHFAoP8ZttB2zM2dx/QLbGCtG88jBOvzsi9Jl5fn+vqid+8Vx+WCxOkDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3410
Content-Type: text/plain

Add documentation for the newly introduced KERNEL_DTC_FLAGS variable.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8c6cc46b6..ef6d46d66 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3870,6 +3870,14 @@ system and gives an overview of their function and contents.
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
+   :term:`KERNEL_DTC_FLAGS`
+      Specifies the dtc flags that are passed to the Linux kernel build system
+      when generating the device trees (via DTC_FLAGS environment variable).
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

