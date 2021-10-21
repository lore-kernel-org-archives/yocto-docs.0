Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DC0C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 08:43:54 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.67])
 by mx.groups.io with SMTP id smtpd.web12.6572.1634805832439690263
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 01:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=O/+zse8u;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.3.67,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2LjWyb179m/tF1wonjwXMUv5xHUmB24iagxqm24EWjKCuPJ11XsGBtVzi36DJbAc4CTqtV9PXzuSsoph4pigLjS8KdPjPRMDoaVQzqcVaBYc5SGp5fzUm8Bccd3BqzFAdh0fvi9aD6mMD5Ps8hCQMzyO2TLjHbh7Ex10dFmzy+a1QAKKDS5awmP2xtIVsLbH8dNJ0lvHVYd6LQl1z9JVm2QjcGAzkIrXsJcRdIntKY54X7rIGZYOxVY/e+yXhtyRTT0boY1/dvYU2Q/5g3bX+q2dzXD0jNMN6KP9kgTWx4g1/TdPXi0S4yZLzW7Pmi66UsGWhOcL9gMKuv3CYCZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3E1IcutKETH6djOWhnDEgr6ba/TH9VRoZFjz34kLfU=;
 b=eAM83akrJcENWvnXbQthArND8O8tFZrBs9Xb8bM37nDLUAAIjzzNl/GsfsfNkLNMMMZnldiGg2ha3xwiDzdPTk0CP2Mmb+g+0fVhYpPXgGAO9a2lA3f25jJfF8lORZXt20rZbGuoRM47F7khXkbX2NABjlZygULYb01mxUa+NY11VAvpZsxG11P/11gmDi1MkeCKv/EBDlNsGu71Up1owEkD7/3LFiDg6W804tbe4lMZCRtRA6hVY6+4xksEvTnvlx5vRaLpzuBpumg+/LCo0PeC8dM4ZcuhC1QrvmiLYazPNVQ0sIaTau4GaihVcBXr5bxI/1Pw3Y0Qstf4Gyjg6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3E1IcutKETH6djOWhnDEgr6ba/TH9VRoZFjz34kLfU=;
 b=O/+zse8uibxbSX81SGnngW2q1ZqRFcdXFd2qh4ZrIRuU0MfJ6RKYzdADNIpxaR0TeLKnBoJtiDzJvwCvZQdIzEQX4bOkD9HXLYZuz/eVm0aT9iMYFIXtgA2z6g7sk9mXJj36VbQDuGWYuzZ5hUQahAiSaW1cUrlQU27Z00aavLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5073.eurprd04.prod.outlook.com
 (2603:10a6:208:c9::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 08:43:49 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 08:43:49 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: 
CC: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] [honister] conf: update for release 3.4
Date: Thu, 21 Oct 2021 10:43:32 +0200
Message-ID: <20211021084332.334075-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR1001CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::33) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 AM5PR1001CA0056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Thu, 21 Oct 2021 08:43:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a40294b-08fa-46f0-6c26-08d9946ee72c
X-MS-TrafficTypeDiagnostic: AM0PR04MB5073:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB50739DB230E2503FD733AC59C2BF9@AM0PR04MB5073.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LKb6DvXPky+MxTidwrjN+RMEj/l3dBfvGFpFDRgMq/+bbtY0ZmwWOd/Pci+Q1sPN5ZJXyvCSTiLAqHZFYhx9RKmSJFy2AhdiPvn94wgvxKb+IsHWaYYlC1O897JuBaQIDIAxV3GoNx0s4H0woSNFqiscLKajbHwhMGLuyZdNtaRJpc5oTmLmElwXWXnKeOxY+KN18tGhI9zUeyoBvhHcq0u3K7j24vtBdgl9xbe0JSpJu4Kw1yjcBzsM/EIUIYciQued5XwqlMsjDcm/PRnxoG9Px0IWkv6sXXbVwJn48Tfv51USUkABzdM3v882aM3mq2InaQslZ88u0fSynOK8QJub0BWmOb6l/nOlPTm6RR7lD3mpNg0KWoYIsbRFXbub/2ERhUpGIBCKmDV3SfIzhCo5OdZIsbw7QWKcUjhoiFc2Dv8bPJQztiO2BwVvckJg+wegxVf8Xrj2a0hgdwZTonLNiHwvwZhrQyrpHDcMcWyXdHryVxa3zRxnKIIYOpnND5MJtYYoeWga3IMbqrUzYGHc1Ckqc3rXx3skSk3v6ZkK5wHgBDAIUR63Q+AqA0lFk/MWmCu2HAcdQ5Hp2R4XjASK6RlbCIZKZ1ztTzT6eB5b8/G/Femw6ZX+4pN9pMWYZjVZxUsrERmIichdhZqmcEoN/C4hCrj1JJhLpLs7D4Vjge6SyYqAbWzx4sF7G+jzTOrEzss0CVRqc7U5Q20zIeDVmqcqXfWPEl9AL6CvD34=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(52116002)(186003)(15650500001)(8676002)(107886003)(508600001)(6486002)(66556008)(6512007)(44832011)(8936002)(5660300002)(956004)(66946007)(2616005)(109986005)(1076003)(316002)(83380400001)(66476007)(38350700002)(6666004)(36756003)(26005)(38100700002)(4326008)(2906002)(6506007)(86362001)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dVnod5OtDbMo19Gnw6Yc6X3RZy2RuSaKvSx2ZLPLT76RjPm5gB7CUyfQKkSL?=
 =?us-ascii?Q?19Tj8YSPc+VnFBGybo+PPEuj9iORHsk42sxPJ2fUfwIfjXFfk6zUVt2uR5+2?=
 =?us-ascii?Q?C//t5Cwy/i97XHk54fDs5Epl2gikPX+lQ6BJUkrhXAr8q39+B7q322138dMt?=
 =?us-ascii?Q?ezC6/chvcuN4OOsqex07wPr4ED2MzukN+IdCm0gjt73gno0FWilsKZar8HXs?=
 =?us-ascii?Q?1B1qAyeLRqIG+1tycRgS15JK+XQhCUJuvDDSq6zLIUv6Jt6l5GHWADEvFZ7+?=
 =?us-ascii?Q?M8zj5uSuZ8S7EBkvyYBn8+VVXsWlqrjakhv8NGhUdxPPplEBmoKugJBZO3MB?=
 =?us-ascii?Q?ixIiO3CRZtHs+rKlBq7ldU/yPLe65yYC6B6H2Dt7UNvajQhdZfPR6Z5HHOLw?=
 =?us-ascii?Q?u96R3YrNrYrKNU877tqfhKG/y+8zZuckWtTg7COPV0gXAoqjcMWP4P6mLDog?=
 =?us-ascii?Q?eaHRZVi4LL8/hkmxi4yK3Wp/06LI3WhR+i+mGD+RoeJzQrtjUhzN9SY4Smbc?=
 =?us-ascii?Q?49+R3U9rhkRW0wEmGWitzgxDDDkbvqI2qad53sHXVBnTua/zVerspTE+ZNj3?=
 =?us-ascii?Q?u/QmM1hRt7o+DJzDM2K2rSTebV6HLRz2JQ8V1vNC8Sauh36Xs68PHFDpj227?=
 =?us-ascii?Q?cn6464tvS0NI3pX70LZP9vqHbZNzTTku/qghIoIa5E79bSAk/9Ig87sxpdwa?=
 =?us-ascii?Q?3UaPabKpDyL7GGjxseMKeA6K0CuETsS0TiV59I7nEb4RqbbTwyhIN47I1hB9?=
 =?us-ascii?Q?7qElJCkYFqM7TeY56Eq5TPzCuAvv0IOmMy0I+jxzNl/8+7YoGaufbuERX92O?=
 =?us-ascii?Q?pwIuDdf2lYYSJTxYZhOHcrnnTux6YosOxZT4WJsCPKS1myUY9+51m5BLRbKd?=
 =?us-ascii?Q?124q96LxZszbAND2OwI2w0aLRLMRoKiz8PLIREd+Ejk9/vADIcvTnaWSr+CH?=
 =?us-ascii?Q?5C9NCjjnzKRymuly8VvXUjIL9GXQCPiE6DhZyswCFyGUi9fZDxqh+yIkP82b?=
 =?us-ascii?Q?EV3R3AXCrDN++AoLp9vHxT2lVlwR2/FMqWPRkTaZoK3Vi/QNk7WFPl1AqZKv?=
 =?us-ascii?Q?BDR9NVM/zXCUWMPgciE6/5BxlUzHqVNjyVY7G3BFXJbiuz8uXseldP4QyfZP?=
 =?us-ascii?Q?vGxtwhwjRVBKlJGt+6X/lRvWHj2yAEaR8klhw3Z9NwCsC+ASz5L3svly2PQq?=
 =?us-ascii?Q?6b24FgWDcSrv1mwMg+btQHFsoTYYgLoDGs18d7i6FBJv6CD12Wn/lt7hptN2?=
 =?us-ascii?Q?ubRtq9pBAUVA3ldSqTiymLrE3qaDiF6OzX9+y2na4qa9H7Z2ntXnfh6DSHge?=
 =?us-ascii?Q?I0LP5jlLcN/2qJ8qynTqWxuDSZMrcGDwN1TQHifUxpsEZxYTxWMu2YD329We?=
 =?us-ascii?Q?a0i96Wr7GPuznJA2mTdoHDv2G0bkvelFVKgUN5pqEEUBVUidXKlWZc4rzAid?=
 =?us-ascii?Q?BuNbvq94g13aDFiLNXs3qpgRUs9Ig0rXDiQlcy8GpiRvzxBaY6P0fg=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5a40294b-08fa-46f0-6c26-08d9946ee72c
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 08:43:49.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 quentin.schulz@theobroma-systems.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5073
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 08:43:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2019

conf.py:
* set version to 3.4

switchers.js:
* add 3.4 release
* update 'dev' to 3.5

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

Not tested + Assumed to be enough
No need to wait for the new release as the honister branch will be
integrated in the docs only when tagged but let's make sure we don't
forget to do this change before tagging a release.

 documentation/conf.py                    | 2 +-
 documentation/sphinx-static/switchers.js | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 8e0847938..104b49ea0 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
=20
-current_version =3D "dev"
+current_version =3D "3.4"
=20
 # String used in sidebar
 version =3D 'Version: ' + current_version
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphin=
x-static/switchers.js
index 1e37b625a..6038dbb5a 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -2,7 +2,8 @@
   'use strict';
=20
   var all_versions =3D {
-    'dev': 'dev (3.4)',
+    'dev': 'dev (3.5)',
+    '3.4': '3.4',
     '3.3.3': '3.3.3',
     '3.2.4': '3.2.4',
     '3.1.11': '3.1.11',
--=20
2.31.1


