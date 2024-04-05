Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2D0CD1296
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 10:14:46 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.115])
 by mx.groups.io with SMTP id smtpd.web11.7597.1712312078568996831
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 03:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=mRBCI6ri;
 spf=pass (domain: navimatix.de, ip: 40.107.247.115, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7MY9+8uvfftkTmYtbeoCPKy+Q27kZ+sCY67U80/RsiMNI0acVkpdombP1AclE7vSS4HfmRYwIJRQknDqdsyCP6PBslnh/RiQonJQVPC2r92QvOZmpzjml8GmqhvBItxdIPxzudouqovx1uv1zOh+/2CtMhyL6E7rsCfqMcJ64tXouljYWQkh426FmWijuggWYJ8sQcPavbNjM1A1Ht/KlBNoj5+4corzfJ8LhCnYLGYurw0qWCj2guqIfd+pPer7cUJGJ5/CWcGfjT4d1IPFnlLTAfFp9/Bn7Iz+yfkw21nC7XiVatErD0Dyou2EdfH8KKHyxkwih2EaqZtNVOBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ7c7hCK2oHHza4rWGPPX5R3sIr9Ycfu0v54RTvOihk=;
 b=bxgf6VxQuIHIJyzejbN/njjAGIn8Ic0ZrN4329lf+ochG6s0Ep6tGLGFU6NZbXICTkQFUroz8XYx+y3I3lQ+5KId19O9YStuXbV+vxQctL4zLC2Qh4Vwkw9hpJsgyrzfCg010MHuyDymVvX9l0gRjiwhtNcueBvnoKBYeT7xnxodmNZCnNCk6UgC8KOW0bECYa5ESI094lzHuznqomyZoAPSDLLNcibqcuC8kg9GF/n5fprLvXXo1zck/tnL0BLLWz4pQUX5lw+FQrR2qMPHeHTLN0OuXlqcbCjkuWJxHo8UMtzJucJd0Nlmc4zeO/mniRNKgUyDchp/FzYhRSUxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ7c7hCK2oHHza4rWGPPX5R3sIr9Ycfu0v54RTvOihk=;
 b=mRBCI6riqDp7qndUORVgZM78OS+s0tegojjQUVdlf8sRSA6QrvlYS6F4alb9Jqtg8bQpz7BjRqldGzm6UoGuJKOj7uNEIwr6difJsLFSLUNd+KXuxR2P3NbpbYbFVcC3bvvNAOUpSa4m2MUImU0Cq4ux1/GjsxUFwNz6aEcpot0=
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by PA4PR01MB7839.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:c6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 10:14:35 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::b064:fa2c:a00f:55ef]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::b064:fa2c:a00f:55ef%4]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 10:14:35 +0000
From: joerg.sommer@navimatix.de
To: docs@lists.yoctoproject.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] kernel-dev: join mkdir commands with -p
Date: Fri,  5 Apr 2024 12:14:20 +0200
Message-ID: <31036f61cb79b07a4e774d799ec7bb8cf0bdbf07.1712312060.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::10) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|PA4PR01MB7839:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b2YYjcohXfRohsgqT2rsYkvD3h29R2Esc0ItO4FmuVkBpShpZiYlsM5uN3pktG07m0yMc6ybPvCyh6dMpUITsMlRPMzFuyb88tRl61bcWgZ+reBN0Sa8YLdDKm9FLvNsp/yEsT8XVsvWcQVu48aW8UYqSzaTAC7KO4MZAJ0uCrBj3S3aMfhiZPBMrfNGpO8abFl8qHjMqcP2sHqsvVXdp06JXt1lXdEtcCcf87QKsfq1mokWAO9U8tHZJpKnW0zKmyZE/gUD0subb1Vw8kmR87uxoX7P2sFy3NRytSqivpqaxPIDoz7LKEorrWGzjr2yrCHqTHfsoUEYnQZDi11/CS32ReCxcmBsh1H4SJc0W6gZF7SgOTOfRt/MtRugi1Kl+Ju5OpEVTYzsHZSg5RC1qK4Ea2SI4sL81jtzH20no/Bu0kf2uSnsM2Ggn6gMW4pv3mZXvbKxassjhop3oOMf1XQk5rzA4ru+0lLu+uPmDltfxLjUZJl78alG2NchvqM6NOk25UeFRpmpjieL1Fpjjm/S6zYjhadAt9VkUKDCveocVjzgNjGKMF95CAhe2EfvwDtK8YuKOHJXBa3JynZJ5kMGHFd+rTAScj5UgYNsKksmf8p+CUUqPs79P+lamOzUhma4qi4/WaOTjZ+cgFGk45lc9P3p4EVQ43ZZytUpB1F8SeuUTmlz8+aoxgQgpPQUCsK0M8ijOoEwLOyIG+llKw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sc3qSbPiwO7FSdv3LVn8G+BrGpQexsLTToUwQIrAyYrnDDYk/5SVY0986zAr?=
 =?us-ascii?Q?/22orh7SuvJGpY7dCFLBnWURUCGSga/YILC57llv6axCDB4W2rqN+v0ey/NK?=
 =?us-ascii?Q?ZZ9NJj52kv9QoOeeE9z0iTIiq+TUhfZ64elRySZvU1MZGAQQlAEhEzIvKNbh?=
 =?us-ascii?Q?iMUObpoVWB3e4cVZHMfRCIUQCXWuvzepV1qWRD5Ow/xi9S0NAAZ0R2GMIgqI?=
 =?us-ascii?Q?RXNPq6jgcFaM/yFB1hcywEGleBlmENqgNW74u+sDo/TWbk52szPOUYYqOXuh?=
 =?us-ascii?Q?EuccUTZ2bFOagIe0mgGy0zHfSPnKBtq7G1N4D3SDwDqj+aAHuXEBwItkVA4U?=
 =?us-ascii?Q?6USLhD36d2yFsbpZWEIpDMqlrkKYjlJAMorAP3Ivm5m2D6AMkeePiKURM+rG?=
 =?us-ascii?Q?sSQTfGsdvD00F4MU5TLW73B7EKTi6y4mb+CBY3aC8YERTB/vV3bGbEyPIHZt?=
 =?us-ascii?Q?cPh9RmKlXiyQxnsceubwTwOOQEjgUBbQkj33NsR7EhS3aexRPQw1qc2RcWws?=
 =?us-ascii?Q?P1INLc4G/fNXEsyOkYcDdUMqCoYPVr/RuLMZVbT7wPMa5APBRfIca0Qd882m?=
 =?us-ascii?Q?AVl4UWnfuZ7GH/98qRl/C+wt3d0clLOkniIyYyF6yS8OZVfMFdRlVAPi5AUC?=
 =?us-ascii?Q?BIRAiYkqfBtnEgUltPocN0Xr1YMGJKnXlc+e4bSLMb0u9SGA5Ns45RwknMXM?=
 =?us-ascii?Q?vODTGuv0LvHNnVK77n7dUpzgdfht/8GPtuWpIm/B9e1Y0+isIOb2ZnILIrzu?=
 =?us-ascii?Q?eIT7BOkTN2Rm4WOrT2QJ4Wf+UnTL0jNwEmm82INPjgw4MDahrCis8tAw2Nac?=
 =?us-ascii?Q?ORlsTBCzDBDzm9i6GzMVNL/VHCsr8dJMXEiWg0sV6D5ELhCHJ1wpfSjJ5IZk?=
 =?us-ascii?Q?334MLmQeeXMPG1B1oRMQ1ssjsbqAnXj8ExP5EKaHuPMrX4t/6M35Mv5c7KeI?=
 =?us-ascii?Q?ix4J1auzWz0jId9Tcvmr+incP+G5YNYyX55GMY0Ubpcou2P98raYDYz5w/aj?=
 =?us-ascii?Q?K3J8U5fxIfRgEitNWINdgBa1Liqmei+jSgKJd+g2q3HZpu3c1d8qKu9TCYYj?=
 =?us-ascii?Q?Ird9V9ZgO8HA2zLljNAealfnbSrqaS500Y5vS0QraSLsKLiBw2E+9oO1XdCp?=
 =?us-ascii?Q?CbQhmy9qLBd+AzNLHQOwI3DP83d0ykQstL+dJBVq5Kn/Ugm27NKpuXQbkQ0O?=
 =?us-ascii?Q?HPsynIPoQB4q+YEvmUv+2EMpoJ3Jme+hUSChi8znDGgaCZGGl8HlEFZF8ZLj?=
 =?us-ascii?Q?49ng7zyMy5B3svvBgyGhBjXTX7KqzCIU79Xp9t+za0MriNcxSIuEHE7McV5P?=
 =?us-ascii?Q?AFtiftRV20qghYh/w7kE7J4wYCIVxGSGgBW4u9kxL02bJ30H0R4VRpqQmjtB?=
 =?us-ascii?Q?7eKKeaBMeEIMzxAdmW0TaUw3KtCRcRcnw5BsRXjGEzvDWG8W0CxlKxsMGV7Q?=
 =?us-ascii?Q?gvlHr1RojNLt1YqdAOwFiNrBmLcrNhZf9VC2pj4Ll4VlunF5sbyI2RZD05yl?=
 =?us-ascii?Q?l5hlQwdo+bhTHgN3UaMzNR+MgEDJ7+Wy4DbDIW+1euQGoIfO4J/D5jojFhMo?=
 =?us-ascii?Q?+u3B2iW4Ea/F3CajXqIqPJ1kGN7IPlTxx2kbwiswn6AH2Vuzim6Oq22ZRdFz?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: af29840e-0769-41f0-11ba-08dc5559318e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 10:14:35.2713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Msl/LGY0RG3jdGGPNE/+X9hPvFGD4lMqvdOEquekh6Rpz+ORjOtlGTOAyiWMI61Nvx8hqXyuguQzDB+6gFeG/c2aD4eufT5IptV6RXYcRKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB7839
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 10:14:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5072

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

To make it more obvious which directories are needed, pass only these to
*mkdir* and use the option `-p` to create the missing parents.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 documentation/kernel-dev/common.rst | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev=
/common.rst
index 0cee503346..9a7a1907f6 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -315,11 +315,7 @@ home directory:
=20
 #. *Create Structure*: Create the layer's structure::
=20
-      $ mkdir meta-mylayer
-      $ mkdir meta-mylayer/conf
-      $ mkdir meta-mylayer/recipes-kernel
-      $ mkdir meta-mylayer/recipes-kernel/linux
-      $ mkdir meta-mylayer/recipes-kernel/linux/linux-yocto
+      $ mkdir -p meta-mylayer/conf meta-mylayer/recipes-kernel/linux/linux=
-yocto
=20
    The ``conf`` directory holds your configuration files, while the
    ``recipes-kernel`` directory holds your append file and eventual
@@ -964,9 +960,7 @@ Section.
    additional structure to your layer using the following commands::
=20
       $ cd ~/meta-mylayer
-      $ mkdir recipes-kernel
-      $ mkdir recipes-kernel/linux
-      $ mkdir recipes-kernel/linux/linux-yocto
+      $ mkdir -p recipes-kernel recipes-kernel/linux/linux-yocto
=20
    Once you have created this
    hierarchy in your layer, you can move the patch file using the
--=20
2.34.1


