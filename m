Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA11C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 18:55:52 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.95])
 by mx.groups.io with SMTP id smtpd.web11.81472.1718996142070959403
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 11:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=N5WzZAjB;
 spf=pass (domain: navimatix.de, ip: 40.107.241.95, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fh7NdjdF6AwTj6D1cSHMXiwD9XRbs89b6vsF8jP/RNNS4Dk9QNh47xgpZqkB6kM6HvbxtMyBL+SqYTVX9A9egoSINAU6QxwsBgLuF/1Mhphc7Ajff0hOHP9q2nqdvtZsuc0wTQ6OGaSylP9s+w65uUALUtxUdH80oOaYMfEBr4SF7KZknC5+P8c+Nze+zZ/jBdS5I1UY13rZAswpTWrNDJ4CI3kb4pV95b0a3dH5Dwb86eehavPiwV+S8rma47gdWR3ELDB4r6sfJVt179hEn/2T+9LT7ivGGPyXJX32PnIHVVgoh2iLP8V9AGMHTwwjD9AHkvKv+6MoADw5tu1vUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULdnhtU1Um/172K8SV8cIASLH27mOouFML1cu9Z8/RM=;
 b=ALXAMmooUbk6d6ocxTFTXOVo+cLK30eyAWKzAVqhgaMJ6nXy2tic83KF2vHQcQS4LUxsSPqlDJwIylQ8XJUdKyT7JhC4A64QAQgwdbYxpA+F4LaqMz4AEClkzUq+xkGs+lgFLvGCGvxT1sShh39B60jbXq+HDnTYAJgoMuYJ1Vn10lKjcKy/F8forZ2nL058TX2ttIFQ6OO9Stju7tKMgGqoQWxSCE5tClngr3beDLzrZg+JClkpnuL3n1/rqMpBfmkxmznEwLFw51Bq6BcgMNTdxAFgeDeUliDrKymva/sUgBA+ygcdsT01XeOtJ9waCF5dyTWH+IpEEyEXZFhSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULdnhtU1Um/172K8SV8cIASLH27mOouFML1cu9Z8/RM=;
 b=N5WzZAjBGIoH6HBMAHcrZ/DRRqQximj1RfUTl9PWuLNC3uDnx/Mxc9At83XjQvELIgJOdtLLrYuTGvrZSrInQrwvf1RlJfUkQlqO5aIsgL5qnI+vOEcHe0chymzX7k0ET8K31agzfQaq8wUssZYUYTEuo2eIh9LA8qh6XNTP45U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS4PR01MB9016.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4e8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Fri, 21 Jun
 2024 18:55:38 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 18:55:38 +0000
From: joerg.sommer@navimatix.de
To: docs@lists.yoctoproject.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] ref-manual: add DEFAULT_TIMEZONE variable
Date: Fri, 21 Jun 2024 20:55:26 +0200
Message-ID: <b62a042438fb0cdec9cec6dd18ba226e84d35b57.1718996126.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::7) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS4PR01MB9016:EE_
X-MS-Office365-Filtering-Correlation-Id: c8973d54-3979-4411-de6a-08dc9223bd69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|376011|366013|52116011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gYFvUMXAegwyS4DCesjKoGZ6KrN+3/xa1+GOWul0Db1P13smAChBtS7IItMN?=
 =?us-ascii?Q?NvEk0U5JoXvfpv2kQwHybt221jJCWK5uJcm9uYzKUmdpbfVDaMlCIg4rykUe?=
 =?us-ascii?Q?OoEmCbBWUVGzL+3DyZFJ+iNHEW49hihdrZyFsbLCMhYqGGZme7b5CVavwslD?=
 =?us-ascii?Q?iUBysXaXpeQfHeKQOstpwezWK9KgEGMPMV2LK5VlfsL/DZsJ7/P3P9s9Tbvc?=
 =?us-ascii?Q?8Lv7noaO/krYNuy/j2MfqSBAogVawX1oZrp5VBqOD0JP18p4VYl3IlpnT20n?=
 =?us-ascii?Q?oHKwek/r6PsHI+gnso9TIDjxvs7bCxvp13gbdeCnRxMYqfHAgJe0vaxKLsxD?=
 =?us-ascii?Q?JbpxT7Z3FN39d7J2mitYe/WMsuBQxm5GtpPAXseBCNv66b19lxkrGj27ku3l?=
 =?us-ascii?Q?velETMSvFAnKpeuYkkLj5Uv5tFVktxpH+npRrUOoMpSsL+qpTIAGGJW39GUr?=
 =?us-ascii?Q?QFVZb61U1btA+nl0i5myzts4seulhuejKkGpglAcFUxc2DT3WXKPQPivi9kX?=
 =?us-ascii?Q?GaQY0ABsrVO07JFSeaiOdJIQ7mYb6yN/VZDGLwLEMdLNMgiNTO0XnAaYJoC3?=
 =?us-ascii?Q?tJovo5KP32EmB2CHALHB9SfAlOlkgfRCvhWj/fnpOwkMPSVroRP686J09djh?=
 =?us-ascii?Q?orVTUMQ7R8jVEUqSxA51oKXor7oSQheKMcQNWT9f7c8nuhNYA21/a8zfCsUe?=
 =?us-ascii?Q?vjeR0QwC307CYS94G7dpVY4s3mXQyDrNg2gHIogf+AM3epWLqfShuwRn3qS3?=
 =?us-ascii?Q?b7GIhWc5WJpb9q3JSGq4V8dPtl2OUG3d9FGuZHECsYoQZAbHEdnXsqQ2B98+?=
 =?us-ascii?Q?8k/3zapCtevoIXKFudX4YNcUb9SzCrEeLQoZ8t55UszfDxkrrKuYZQp9Ufhy?=
 =?us-ascii?Q?rKX8X0myGqqYf7vidqjhtk/WVCMBtugU5jlH6gQmxlYivnD2D6ysPsrdHytf?=
 =?us-ascii?Q?XDUWpQK/h1YM+68dHPQBgJt/HsXNiTXv95O/5IbnN3VW64xAfRHYnR0mGGPK?=
 =?us-ascii?Q?qPcTNrAiEEXmsv6YD5UznidrB9AI2/F2lfC4Pp5qWyadmN9/UWLLjiUQDKo1?=
 =?us-ascii?Q?s+W8uv525dquwiIWE18jzJt0q7hwcYHDnuBz4jKf4VQKBfYHwI9+R5Ts2+xJ?=
 =?us-ascii?Q?w+P4FUAnnSw3bE/yY06cabOaGK3F46iRW6P3xOAJ6OygSBwiuWc/uJvrneUl?=
 =?us-ascii?Q?ly3+FbeKmr3tBk/KdxJU0onqRFIA61JgX/UUVw1oIsaMjfQiQekNBu9jrkXz?=
 =?us-ascii?Q?bnhkcWRimIUNno4WI8odpMaAG6Rw52MXgNwOy+Sd/mfcO/dO5VPKHz5JhelK?=
 =?us-ascii?Q?y8FN9qtgPS/VD+7xZ8V9rJQtfHtD6yTA0AARbruBqgf4LAcY/PBwsbMq/6lN?=
 =?us-ascii?Q?e/ZgDdI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(52116011)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UiNbXl1AP4t1eMfkNmMjqGE04wth565Zxx3SlUL9uy56fXkBBo8sIMZObRw1?=
 =?us-ascii?Q?MxTundeDXrgR7OPdhMhtYHVF8b/5ZAxV9gqCk3zpqu3vqoh4mU2DIPM5D/9L?=
 =?us-ascii?Q?jAonxE8M7uwCErWicNWccmN2GTUBVPUSeA8CyozFotRLSai0vePksJNpzgSR?=
 =?us-ascii?Q?WoBugu5n54o2TOisuwV6PzwZbu+XHLGf7iUBpz3yLksIHNhXWL69tc7SXCMH?=
 =?us-ascii?Q?naHDhgpwbfpBQv+HudqWQgaIytsY+InYDy1Rlg5d/lnD1QPYjOD5VdSyXNfI?=
 =?us-ascii?Q?/zZfuISsfAiygIinHGuktH7jxvwiX/+rmnlAvWTFSOO/XQBYs92OxAZvNemh?=
 =?us-ascii?Q?MiDeYxOlwsEdfn/jwK7mjfMy2JAj+Oao6hi2zhhonI9Gdc+Lz9n6Iq7S/WHj?=
 =?us-ascii?Q?cW8W29qnvoDJ3VMJ/6SfAnPEgOj50FdWDIx8F0jvpKfUjYVWXru7SPWIZo57?=
 =?us-ascii?Q?MLQyeE/BAJ9/7kafIXzHGs/dG6rd1UurCoMowl8qG3eh+cajAKy/7azx2wrR?=
 =?us-ascii?Q?ueyy1K84Zbcb0a31ienVd/h290Ygh1I56Yw7AdY5hF2zTnmONWl5cAefNE7i?=
 =?us-ascii?Q?yknHOwsKTbtLj5O58qcxFI9XEr52eWVcxJ9l5tlOFYKMVgkBypFm1ZlaqL90?=
 =?us-ascii?Q?A18I7286miyFta42bT8hjpk7WUfgZFP4YVdbjt9mpFBIOQns7S6FT9cUo+ke?=
 =?us-ascii?Q?TnfhmHgZu1HaT6IWTOwjMJrtZ4dewn7/6yEezp9NElPI9GwYnC5vCGfnUI6i?=
 =?us-ascii?Q?+ZW25FSupQJ+xjNEaHs5TW3Mz0ENhtxqwWJobA8sjD9OWlXVavXocFJ9r57r?=
 =?us-ascii?Q?+35giBFCpumdsa8QTgUYShCkMDOtZD+nx4tAT57vcWjEJRVC9nbuy+4v6TNC?=
 =?us-ascii?Q?H5BjwakbB1Z4XbRSOAID8HCCQdRjT6zK2zcuceR2O2XQbg1DFCZPH7Kvzw+i?=
 =?us-ascii?Q?GECCj5FmGzFSBaJJ84O9VMcapmfVZjFevhSiUI8tfkso2Hf/XOXVzebzNogr?=
 =?us-ascii?Q?t+yAxCpHjuZ9gGRtShnCjlBKv+ZzcS8PcN4RxPl+4gLjHBuu46X/8Yq4zrVD?=
 =?us-ascii?Q?Xv+mB0cnCcsRpq38sX2kaca4p3tjnEZORcd/DTYstXQHxL+9oN2baz7AdMnj?=
 =?us-ascii?Q?fUMglEy9eBTXyG3OIDV9nqgEMD7Gn9th2g5U2EbH4Fvbzrw3qWodSfiIqR4z?=
 =?us-ascii?Q?LbQjL1b5rhyIOtnGDa8Qh/M8UR8cJGaZnaOvwzJS6jQ/Ph92I3TiUAvaxzIO?=
 =?us-ascii?Q?sB0SfFin2UoRbwM0KzK2QW7zC3qs8qPIedH5dDnQazYjPHNTyaG24zgM3MOI?=
 =?us-ascii?Q?wba0tbgxiWgvIXaiUd+8QmXVtN/SWHLGCt0vIsFI2j5NvzdVbU5sRPf2B4Av?=
 =?us-ascii?Q?N9lq5Z1vPyzfA6vGxzRunK8NlLxJul1RT5Ic5WlZ/A+QD4vrzAEAecT8P6O4?=
 =?us-ascii?Q?oosCvAHERBns+jECSErKxSxreNLLih4+RvJhvynTy21dYFkSuYKK7eQKczOU?=
 =?us-ascii?Q?6EyzAVsWnDseUBBcnZo+dwpB93Iz+e6nBQsmhytCbdTE6MeAnXLRQ0zy3Y1N?=
 =?us-ascii?Q?xOwTZhUapfhWTI2b0TOlYFmFr6mogUthQdOmq3ynzV17YoIvD5yrLg2AFApw?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c8973d54-3979-4411-de6a-08dc9223bd69
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 18:55:38.1000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4j8BKjj40slTQqy+TNtFpYr4egAVEGEDx0JepiqvC6pN8DgNQNh7A9uzQppC8trF9JFjmoTgA8Ba2zlcl1UD1wpbrqjxicReJgjoQ5rxI1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB9016
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Jun 2024 18:55:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5300

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 16b449d6b7..34d0d239bd 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1877,6 +1877,13 @@ system and gives an overview of their function and c=
ontents.
          by :term:`BBFILE_PRIORITY` if that variable is different between =
two
          layers that contain different versions of the same recipe.
=20
+   :term:`DEFAULT_TIMEZONE`
+      Specifies the time zone set in the image.
+
+      This variable causes the ``tzdata`` package configures
+      ``${sysconfdir}/localtime`` accordingly. Valid values are all files
+      found in ``/usr/share/zoneinfo`` like ``CET`` or ``Asia/Baku``.
+
    :term:`DEFAULTTUNE`
       The default CPU and Application Binary Interface (ABI) tunings (i.e.
       the "tune") used by the OpenEmbedded build system. The
--=20
2.34.1


