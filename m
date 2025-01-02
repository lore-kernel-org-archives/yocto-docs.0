Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773B9E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 21:23:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.129])
 by mx.groups.io with SMTP id smtpd.web11.17737.1735853017642853145
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jan 2025 13:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Z7P8kW6q;
 spf=pass (domain: navimatix.de, ip: 40.107.21.129, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ve/w9TEncTKMhi+YuvVqWgYXyU5zua1TCxrLHBW/6EeWQ256Kb7ZR7W0KLD1ETFQ8NHv7dQEibxxB1OZ2X4umYMb0O5KIwOMyPY6tGbOH1yhWEyKDuCEUULbFytz+mywFOrTpP04V2vTVsuhNw5GE7VAQtlkwg9nfBIDaLlY1IlJF/MkgxfIe0bgEjCtlpwyOnZbzgDJ9r0sGaaQP/UMUOaltd4mWkC42lkcz9oRAB4EtWUepSr+KEKx+pDCnP5adqsCTXEqzg4N44gpDa79CRPN0RwSyvCNTLDPiSI/FlQ+KQKMo6KNZcWuY45wWrNZCddLDLnJsNo1Vsfy4CQhBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+DC9qplzYfBoETkeyGyhPvg2Bm6ivse+ZkJhQxSCbg=;
 b=qPUNs5h9HYCICrzms4pjtWx0CHZU2wp1xssN7TVBMAOT1HXR8Y1x2vXSs5MK4IXE4Q4b59QTKfmeYZW4TUgi8y1d/y4h2mIGSE3oev93CFfbDFZWvEspBMvvEKnY88hhNti2mPqz4k2sXVNOD8OySJoK9ejEdxXnGHC4ucrYYZmTOzRFMu2yC9pvMbWIU7qpmvcfPdxORc/csZpHxMzb53jDPTRQmeSvN0u7XUMkNgjbyPs/XGaQVKu/gNcBnr+gJDDVdS1xwlAXsNbW1Hme3ZXqpv6vdjIt36X7ll63xAlDtd43CKrLCLpfu65+ATEwbXDCtnX5epgQnsXHtG2Wwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+DC9qplzYfBoETkeyGyhPvg2Bm6ivse+ZkJhQxSCbg=;
 b=Z7P8kW6qb/5SFOwg9QInnPgojVOW51gnKQHxFqOBjIvZ0HiWC4W962mTcr5mWrPJkgzcnLP9XFe3M+91r0bE7VNcBahoZpjbBk+Nl1faxAU/p27JgNLm+A/lHR7ZIpsUXZeJxjXS45mxfTK0u4PyL2Dj03/+C0ycx8+4gigAk8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB7749.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Thu, 2 Jan
 2025 21:23:29 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 21:23:29 +0000
Date: Thu, 2 Jan 2025 22:23:27 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	joerg.sommer@navimatix.de
CC: docs@lists.yoctoproject.org, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 1/2] doc/logging: small clean-up and name environment
Message-ID: <2bf2a340cbf86391ae6722739f750f9d44f550b3.1735852948.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0343.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::12) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: a257d85f-769d-4ac0-e611-08dd2b73b396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T0v8h1GGLIatdevIVyLlTGa7daBdf21v5RFo8rnI+3OVl2kqSBh1M1w/jvyy?=
 =?us-ascii?Q?D29k2ElP9gOctNNbKNQFaHa4rYkZoKaxepNH35tzveejGEy/dgKkbQgdFyKa?=
 =?us-ascii?Q?GVDTC9ivCitP0wvM0QX3ngRTfhTQJQ8dUy88u9LUqvcxzSOlGZbRi6KUa13I?=
 =?us-ascii?Q?BRdogOrKmsrMMuVsyNKmHloIe+NZJk9r3dO+yoStPd3LdxJm6rWhmyCvl6HS?=
 =?us-ascii?Q?Oo9P7B0ivpxuI9SQsjTHKTknSIPsNx0Bbn4466a7R3xlwiPhFXoiK4kCnnpy?=
 =?us-ascii?Q?tHZ15mkZF0r8YGxlHIcG4YuSOTd2c3Dx7ISy0xacLxuGHvwXTv1irBS5aioo?=
 =?us-ascii?Q?L3Vow20l0qsPAI6nM5xjN00SJZ6ST/QK21smw8B7cX1JTCaXpMa1qwQ2X+rW?=
 =?us-ascii?Q?DkZYZWd/W8aDg3s6Oej15nrfYusYVvvC0Ar9Aw9P+wQfMn7gMOtNszVLORKl?=
 =?us-ascii?Q?mXaD37FtXwwddyQ3uQG6sTGGRTowyopgTCKlZZn4d/clwruKGGJHHtgyYAeE?=
 =?us-ascii?Q?N1ql1eG+fNtW+y8E2l/E8G/LKGIOxW790aAbsDa7EUVOVsWIN2fTiQ98jAoq?=
 =?us-ascii?Q?KkaQo5LvXb/TsR4ycaK3uyqoazh2O9cxFYbGhAxx3UqcKfNnmAy/bvmQKvll?=
 =?us-ascii?Q?cMeUHE7TftKnLBKf9aor1muMe/EXdm67wKebVc+2WGgEnky85oqx/fhsKQB4?=
 =?us-ascii?Q?G3sPFO8UFQIvKeEb02GAt3iyYgFvZItyRCMpDAfpXCKqRQU2lx54oml2YMLk?=
 =?us-ascii?Q?mNKeL0QB/wnBXBG5RDYMqmzXaxehdg7g2pN/ZP8EmjhzX6sQHnWakO+Tg9Wa?=
 =?us-ascii?Q?XddEjv4jstZh7swgPZb1IV+QNKevEtagvQTz/oKLoVdFcvdtlhtS2QEDy5vT?=
 =?us-ascii?Q?lt7Nu8oD24ZlzzKBZU+NJhruHfrDfRovn2cjD8eMlERmCJ2XCaHIsch1GAiH?=
 =?us-ascii?Q?GEbi65R+qalt0pd5lMck5aWzaOTmgZo5pMKmQMA0kjywNlpSqsOKo5CQSODf?=
 =?us-ascii?Q?0FIWsq5QDPXITmxFB7Ff8eLZptsXy9ulp4KeoRqVYc6TOtpWQp08O+nrAZ8H?=
 =?us-ascii?Q?D8NuvL7uEMVEEnYdqK5Q3z2rDOYdJA1FpI7ngERxQAzd2nbyt6sirRvoGks0?=
 =?us-ascii?Q?T4fXdphfq3a/jc6qpEgDO0bLQAcEYrROLEu0kmPlCAiuAkD07sNbfANO+ij0?=
 =?us-ascii?Q?YTxFSUFnRsFzzWXLJgSH0VVglFsiytB9ortG6ulf0pa6TiMgXNy6IW1RuTek?=
 =?us-ascii?Q?6K3G3D25X45li0wPrrJGwpknnjFmrV2RzvvWDgkq1CAKpbGqfrHYrV55O5RT?=
 =?us-ascii?Q?5tjGpWJveqN7EqSDKa2Pl5TU6v4TO/KShGCf+2Za1p+7rQGyWys0Z2OY+wh9?=
 =?us-ascii?Q?jQ/UnXeD35Z7y5wM20mPlUIIJS4P?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+xEI1EJyFVun90QvNdcigsJjUBZ37B6fMRrhBGo2v25/tvVNZFkkoD5eFzTU?=
 =?us-ascii?Q?eZfviDnGz1ORGXICI1zAC5mgw+l0spCQwUIr77yR4NCkKMRN5OSo1E/ErRQO?=
 =?us-ascii?Q?6s7aKxUYMQUDLW/eIWEAmn3KXN9rfs0BLFkB1xmnCV3GM80qY7aluLoCogwa?=
 =?us-ascii?Q?22CUiRl/iHTxxPdQ5uXIEP/KpDHJcQQxRFf/NIXFYDtCcFTpJ28/6EnYHv+i?=
 =?us-ascii?Q?LOtAcpQCXddKt849WdlY/JY85KbLKrd8YKfs2dW6gs5w/KCwa0aBG7fm2toU?=
 =?us-ascii?Q?5W8XsO8YrLFAY4DH19aZZUH3JWwxzC8UvcuiYOCxCX0NRoYCWBkv/V+kDsij?=
 =?us-ascii?Q?IvccVuPo2g67Aqs+TFi2bLe42xcYDo107MQOwvBQcXrOxEBoAiZKx00rt6p4?=
 =?us-ascii?Q?Gueg+zzV8uH+DePbSU4QCpi/jn49puB24ubMlyRRONRFHVCcWG6z5YXOooXr?=
 =?us-ascii?Q?cladPF7jbKrfmjKXM0yQronRcy/1/r5IcfLSoZHyrAO37S4kV/a3T4KwHQT6?=
 =?us-ascii?Q?0iXPgBHeux+g+woeXIOg34XbMziwZYEz/s5gaMWEvY0eKILYB+Ukvm+/4vjN?=
 =?us-ascii?Q?mzdohOUlIwBQkEmt+pfXtQOiV4QLyO4wNNULi89Z0eqh9ztOKaTzQF048UYd?=
 =?us-ascii?Q?KnDBLb4N6sr6617Ksk42jXj075KeL1qNx88DM9XpQEsFang9fmZ0HMyiqnhL?=
 =?us-ascii?Q?7TsPdrJAg1k5GmJ5QWm0i6nXDK+5zgkEMffJ3oagXTt2aeD3IqNzQCdME0hb?=
 =?us-ascii?Q?WsUcSZIQCuoZLgJmb8lggw88Xb97L5V/eVGQX8CU6wPKQ+WOfvpO4eL+k6Qb?=
 =?us-ascii?Q?AgLcIuBF1tWsPCg/iADBlH+SQ4En0ro5wEZD1nll/GjUdAo1DzmHK/D+WC9m?=
 =?us-ascii?Q?xi0t3k4MHC1e0omhRImMqOc8VTnS0aTtQNxOKpHjPt8PzxX0+LA98vj0A4kv?=
 =?us-ascii?Q?n5ybRpuYOUPWW8s7b9PLj0m9Du4zXXWSVKOROZ1XgAlFhHct8duPxldhLE49?=
 =?us-ascii?Q?Op51Qrn+8ULc2EqNn/G6L7V9BBZj74N6x272s3Lnus2vnlkaH+PnWhbjharN?=
 =?us-ascii?Q?ZubyNTmQXMDHi/QXRvcrWjUs+mrfY4P+UFJxpRqh8NrlcPO7a5mLOIs0hWnf?=
 =?us-ascii?Q?N1OC6UHVuCpwQeJqwOjVXPuHcVCS2TxpvIJoCTtg3IuSIvalmuISfALSFvf7?=
 =?us-ascii?Q?FDZs3RsFu+ui38ZNWVGA2mIuDjbrharR3YElRdJWR1uZHaqzzm9wVJThZ8zF?=
 =?us-ascii?Q?l5SlJpOKqExM9TMQo1NiwFv776SuEh5AeZUDLWowhnx1yNlxqgS0/6OHmcej?=
 =?us-ascii?Q?RYJI555pEFAK+mhPlPezRNiygvcspeDT9dOQGtlYs5FsHPfMBZ/SG/nQRKaH?=
 =?us-ascii?Q?4ZHX2dkrTTpJtONTlmykoeBNkOHiLkfcXQsgzzbal9p2bvGLytw6PlG4cnDv?=
 =?us-ascii?Q?CC2HS6iuQGGGAuv/ApNoAhcThCXPxPmjMeV4Ig1TU4AoHi8tc4z5Yxcv0DCv?=
 =?us-ascii?Q?jaY9eTY1hICMoH2hHeCoWGNpgCPTFSG8I4QIsZvxX5BKWh5AT1sSxzkVyNzu?=
 =?us-ascii?Q?3H4qY/adrD8UF4Ds2b/gXr+lKODoDrc/2eV5DrMxjU48JRJsFQvfxmgz6XUs?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a257d85f-769d-4ac0-e611-08dd2b73b396
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:23:29.1985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8BQtBwjLLbS/82rZcd5qXBVQacZw32PsIkEA7mlx3ZdEI3BygZWyTkqeJ3q1zxxECGM6IramTX2+F/y0nkNzxyW2F4L9KLzzoSttBHrTGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7749
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jan 2025 21:23:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6057

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The variable *BB_LOGCONFIG* is part of *BB_ENV_PASSTHROUGH_ADDITIONS* in
/scripts/oe-buildenv-internal and can therefore be passed as environment
variable.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../bitbake-user-manual-execution.rst                 | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-execution.rst b/do=
c/bitbake-user-manual/bitbake-user-manual-execution.rst
index d58fbb32e..0e20d5933 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
@@ -671,7 +671,7 @@ logging configuration is merged using the following rul=
es:
=20
 -  Any keys defined in the ``handlers``, ``formatters``, or ``filters``,
    will be merged into the same section in the default configuration,
-   with the user specified keys taking replacing a default one if there
+   with the user specified keys replacing a default one if there
    is a conflict. In practice, this means that if both the default
    configuration and user configuration specify a handler named
    ``myhandler``, the user defined one will replace the default. To
@@ -707,9 +707,9 @@ or higher priority to a file called ``hashequiv.log``::
            }
        },
        "formatters": {
-               "logfileFormatter": {
-                   "format": "%(name)s: %(levelname)s: %(message)s"
-               }
+           "logfileFormatter": {
+               "format": "%(name)s: %(levelname)s: %(message)s"
+           }
        },
        "loggers": {
            "BitBake.SigGen.HashEquiv": {
@@ -723,7 +723,8 @@ or higher priority to a file called ``hashequiv.log``::
        }
    }
=20
-Then set the :term:`BB_LOGCONFIG` variable in ``conf/local.conf``::
+Then set :term:`BB_LOGCONFIG` as an environment variable when running
+bitbake, or set it in ``conf/local.conf``::
=20
    BB_LOGCONFIG =3D "hashequiv.json"
=20
--=20
2.45.2


