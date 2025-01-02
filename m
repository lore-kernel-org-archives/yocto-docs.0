Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812C2E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 14:14:49 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.127])
 by mx.groups.io with SMTP id smtpd.web10.8820.1735827275194191679
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jan 2025 06:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=meyzAxgZ;
 spf=pass (domain: navimatix.de, ip: 40.107.249.127, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9FhnVyPfbVmJX7tuZhccZArAkojZWJIvTLEgfpY0Wv1ZPlc22VQYFrwp+SGICLRhGYf6r8BH8LOApJEH0+tG4wvXxBsoNXsYcWh6L6gcA9fB8nNLBUW17RAv0dy7UP6MAhRMJzmouQBcfRgnpBrDAZfkCDjU8CxUxk0YyEhmb0//7uXiPaY9rBLWuQ0tQSSGXu/63TCeSC1rpGO2zojSdj2A+C7tLZIupqCoxqrzug58moaxcGhLFNjbkFnwoRahLFzoYb+H1XQX/tTLYeeKZyYHlTDqrtJ0TTAedisNqtel3qikLAj2bcTqxZ6JCyJcWXF3SpCfjurhlMv+d/AgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5TiMt1/YgWNbm9PcTNNexlWd3SyqU7LPqDPMfCPS7I=;
 b=J8kLfvxi+Vyb9p3QH29fcC/sBhmuYPCskswRKKqadLW50kLDl7cuvBYjP+gBDWW8b/rTwiLADu2RqwL7shCHQBqdjZVh1UjkKTPCLUukFPAv7mjOazSn5YlHs7TYuyJA8Snqgu7m1WhkoFPKUPlWfZp7WB8+fLiFyb32pr9HWTpjZsoc8WgHcIfZkbc1vZ0lkpe/HmtFJOmHa63vvGn1hFAtdTWEu9N7VUJe1G84A3RpN9/w4IoUXQoT8HrdlC9MA5iaQU63Ym/W/eLnmXJtY4LR53uvKt6JFxXVB6rAGYhJ2imUl43D663/9l5Zdpajsbe6uzzWbc0uAuQb8W4D1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5TiMt1/YgWNbm9PcTNNexlWd3SyqU7LPqDPMfCPS7I=;
 b=meyzAxgZ1sikfiTf2/i0OGMa1vHoPI73troD8s8FPVVGNG7AdyjVrh8vY7ugb3VmqoJKoEn1vyF65GvuQnKhggVD6tE+67vPOP+8+h2LIpzjKFzCcCPtSsjCL3ODvvXlumZi2f2FPmiXOiuLTxyiyE8ROx8aVlfr2+4NEiD7wx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DB9PR01MB8192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2c5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 14:14:29 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 14:14:28 +0000
Date: Thu, 2 Jan 2025 15:14:27 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: docs@lists.yoctoproject.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 2/2] bitbake/doc/logging: convert warn.json to YAML
Message-ID: <e4f1f8ce2293967baa2f1ed56cfda8a1f285f1b8.1735826398.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
References: <9423e2349e9c4f8e5b3a9490e4539156db533e02.1735826398.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9423e2349e9c4f8e5b3a9490e4539156db533e02.1735826398.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::16) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DB9PR01MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0b0e09-1e17-41c0-f281-08dd2b37c53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kPxkntgJW43mi+X1V9da3FEb4Mqh+dqrgWSGAeh+o/4duAKR0aRL7qsVLOLQ?=
 =?us-ascii?Q?UexR4zeJG7i3L/PJJLNY1LS8Opeb6lA83Y71vxDcW6TLUmHejUgFfdV80rkR?=
 =?us-ascii?Q?e9tI1H4WHVg4Md3NvqX190o2oFoBVvDweNujQoMlW5wouCtyAUGSIwGMTvYY?=
 =?us-ascii?Q?8AAWTyV7XAHc8IBxM56PAA76V5yKQWPnKPLnMWwjNu5KCsFzrBuo82dPsPCN?=
 =?us-ascii?Q?VRWd2lOCvOv9/FmbxGaC/CF9HDJ/NN8JuLKfvjwXvULxW67p9TR32g8SRoas?=
 =?us-ascii?Q?tivmqsK9t14w7jjRyVTfFC2WL64G7rRrcsoStOfCf6nOGPi3CpqkHnd2LyL/?=
 =?us-ascii?Q?QAfHtsmbnycQ3WOe3l9XcY+QV2wkGFBDjTrIVcycq7Wc50hTIBw9ozw1NRGQ?=
 =?us-ascii?Q?WQAKow2IJtf7pP69D5AFYwMtrXmxAAACXWZv7fb2PtHSzengHFS9Woyq60YR?=
 =?us-ascii?Q?XXiLRG0JSsmz4Wt6F/qCvnrj74NbPX92lCjXV5mX+fLg1MBxXq/vDDuM7o1t?=
 =?us-ascii?Q?5drCQVW+9aQgjFLZHnSgRQoDGSzPdd1Y+JcLN8W+bFl9xXF6t0hQH/BQVo9L?=
 =?us-ascii?Q?2r49k4L6eUOpfCjyyyJcNv1Ln53z39UI9inhmPIuK7h6neIBXCzb6Ftqz/Oz?=
 =?us-ascii?Q?dCor/vC2ZXzwlhITBEVTRskRvnsAMoviT6fiQ4GFNd52sjtihZCo7zS/Tktn?=
 =?us-ascii?Q?CRBw3+p/4xbNejB5cJYuwUpDquvp/PV5irObZUNRvoR8H+zq2KUTSujCsEEU?=
 =?us-ascii?Q?yVMaXwL9s/Gr6lNYCxSmQFm0A/mkoxHEow69CwDBFUMTPmwzS8FuiUGQHGvn?=
 =?us-ascii?Q?msu6c8wRdNK6KanDilAi0m5xnUml3rXbqsBJkXD1WkcgX5uciQFcCqMfuadX?=
 =?us-ascii?Q?yD34LSrBtAplKi+EIkoTWGqomsvj/ApOkDke951MApXLpMIBTXjKh1RoMUy3?=
 =?us-ascii?Q?C40au/TTe5/Tt+5Tli3VGr7m62M432INWXxLH4d5Sxn3Zc8dmbqAbvJFlsae?=
 =?us-ascii?Q?dWT9xa6TvN2bm0Vw70BbxXsjthSkdtSP6JW4wLbiifwNkjgyx1/+5jT3/yR/?=
 =?us-ascii?Q?sLIDT5ywz2z5IQz4EGePSAN+8P2IcnvtBJquYHVNgzYI5BXpeWTqxGnZR9RU?=
 =?us-ascii?Q?KdWmnKbWO9y6Eoog4wUTHItfJFcA65sl/feM+db80aPjQK6nKfazqctfgcRS?=
 =?us-ascii?Q?45Qs42+ZX8hRG+9Ci3nb/oE6ESgy2mA2pU7sNW0XVQreApV7uEEFRoOiY4uo?=
 =?us-ascii?Q?VC1F8hFPvkA8rwEumFlRgnKQ7cOgCup+OnhKXTT7rJmltTPJMIPxpeLswXJ4?=
 =?us-ascii?Q?XU7wVJCJIfH5NRlXPRagRfhH2/0cI2hlsytXxxbnsgy7QA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WkJnOXduuqa+6hGoDvPpnCfr5SH7CSnRmNRrmDQ6HEkpArQkL8oRaXgp/fIx?=
 =?us-ascii?Q?APlm8wVmhRnTP4stQiyBFPbV5v/FMkF0qMiCzxvhbgFZOoygbCb3lUVy/1Pc?=
 =?us-ascii?Q?8khGAuvEyS0kaagQ/UDgXYPQg53ROkA0JGT/hg+6148tB9EzpwB6+Roi+3QE?=
 =?us-ascii?Q?rbNDyrI0JedH96/i5WHO4j0flYO8cs89mKS0LBY3bMpFk7HWIsOlxWgfZ/yW?=
 =?us-ascii?Q?121pelpNVlN9Hpj+BTPj8L/onGshQQ91UVr1FnMyNww1+nIRHAD1GP9BKVzh?=
 =?us-ascii?Q?IntLnnJ69zB2KeISN5AsFcEtdEqpXVs6NbqCKOCrM3sTci5VStVUPPZYTZsu?=
 =?us-ascii?Q?naMKgZngLhX6g1cIKh8XU98gVFSQgqvp29Pyf4oOu6h+QKh+quszg1HSTZzg?=
 =?us-ascii?Q?7+KQVNzAOEWDsVUZ8lyXU/2jRcaQSr146y3ZNa1KmZovCAMyeKyykOiefCYp?=
 =?us-ascii?Q?ZwKKKx+bMemllW6+26MfGBDhPur/ZXV8gtsKIbN3sojmUa4K6plnuKh+acWY?=
 =?us-ascii?Q?/FzrHSHe4ktkaGgXjRnxTH6hYPHmJua5o8IMvWBmMPtMa0Gijw5QshpZLJYE?=
 =?us-ascii?Q?zdZ6iYZ6rC9Hd1MqcNT1BzaHS59IKp2KZ5hLH67ApZeVWsrYCXG3GNFD8nA4?=
 =?us-ascii?Q?wfxD63Y6e1GEWfi5ICvYR/kurjvveRaSkksqBRsM27BsBIqADS7We93EUe/f?=
 =?us-ascii?Q?5POgJLKDWsHbjhLGWbO84vi0fCaGbn719ULZhJn3ruBT+46ea8/Wg6n8cvjY?=
 =?us-ascii?Q?ec1LGOnuZJtmHJKxKO2V8cuEgHnPGH/zvz979Hg73IvTbqmzKgGdLFfgZo/A?=
 =?us-ascii?Q?WlXN+LfBovBAJQmZKk0uVEBycb3j7BB25QU5/6pSXxBAwKRohBr90qY4yKcx?=
 =?us-ascii?Q?Kj4VkINRvzu0b4j0XoED95vXyXrmSV13k6XiQ95IEoBiRMzsBh9UgtZXEszC?=
 =?us-ascii?Q?ulpXQxJFLDUkpzp5TSWo/wB5u+c/XkcQgzhfhvgMOYhpW1PNZbAsB1DX7c7t?=
 =?us-ascii?Q?Oifslzl54grqee1I1wjG0CKUsZQ0ERRAxrf7NQgrr6m8RMfspqDCBdgh5JMr?=
 =?us-ascii?Q?+b766SgqIs8OhFLl0iL9nYhXwfcaFtjEP+DERqupi6TTbPy0cCDG0opniLr2?=
 =?us-ascii?Q?rqiyKBTmA+5qY+cTUBh9GD/1flryJjXhrqg1aKXtf3BeRwYxmaOLHCjB16dp?=
 =?us-ascii?Q?2PAj29bo+nLp6f3jSGzeCy3Q1J6vSr3tqIxAxZwMtRWjiC1ZFbVDuVoaybUy?=
 =?us-ascii?Q?/gsrvjyTaTv2o62SeVeQW8R1hzeSjRazH02Nmk9IlPPxYKyCap6cNauUofpN?=
 =?us-ascii?Q?eB4gR1BYWz56R1DirKivWw1OhgauiO2rx/BIzcuUs38vFOr5xvLhR5DS+Osl?=
 =?us-ascii?Q?RGIHCTL4ERlPCAb1zOZgaWtJ9E1HN9wtqY//ERi8K2kqu+4HW0SiT2zHeE+p?=
 =?us-ascii?Q?SiLfu/hXARzX+2UTwDqaCLnJfeHyB3VKL4QMvmJ7Ufg3YImTh2etKoEAFEa+?=
 =?us-ascii?Q?bGr8mNLvh8TgXwxequx/b8oowy0HBcOx+P+D7pKkRuhisRRonaMIGN1HILzP?=
 =?us-ascii?Q?cXs31kYeSUK7hP4IAd6JXGN3Y9zBJumuDBPgeq1CFuxiLnQJvjv3ZHHJd1YD?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0b0e09-1e17-41c0-f281-08dd2b37c53f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 14:14:28.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FkikPUrazcRTNRUsTAC9BG3Z/7X4upDSWnShmcBRSHiJ86V9A3wmK+K/rB0m9TSFQo9NL7IjqaJNNl4UXa6EdXomQq5mT6TnkKC719RzRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB8192
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jan 2025 14:14:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6055

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

To give an example how the YAML format can be used, the example of the
warnings logger should be converted to YAML.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../bitbake-user-manual-execution.rst         | 42 ++++++++-----------
 1 file changed, 18 insertions(+), 24 deletions(-)


Is the @ in front of disable_existing_loggers correct? In
https://docs.python.org/3/library/logging.config.html#dictionary-schema-det=
ails
it's not given. Or can we remove the whole line? At me it works.

diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.=
rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
index a1267400ab..7335359918 100644
--- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
+++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
@@ -728,35 +728,29 @@ calling bitbake, or set it in ``conf/local.conf``::
=20
    BB_LOGCONFIG =3D "hashequiv.json"
=20
-Another example is this ``warn.json`` file to log all ``WARNING`` and
+Another example is this ``warn.yaml`` file to log all ``WARNING`` and
 higher priority messages to a ``warn.log`` file::
=20
-  {
-      "version": 1,
-      "formatters": {
-          "warnlogFormatter": {
-              "()": "bb.msg.BBLogFormatter",
-              "format": "%(levelname)s: %(message)s"
-          }
-      },
+  version: 1
=20
-      "handlers": {
-          "warnlog": {
-              "class": "logging.FileHandler",
-              "formatter": "warnlogFormatter",
-              "level": "WARNING",
-              "filename": "warn.log"
-          }
-      },
+  '@disable_existing_loggers': false
=20
-      "loggers": {
-          "BitBake": {
-              "handlers": ["warnlog"]
-          }
-      },
+  formatters:
+    warnlogFormatter:
+      '()': bb.msg.BBLogFormatter
+      format: '%(levelname)s: %(message)s'
=20
-      "@disable_existing_loggers": false
-  }
+  handlers:
+    warnlog:
+      class: logging.FileHandler
+      formatter: warnlogFormatter
+      level: WARNING
+      filename: warn.log
+
+  loggers:
+    BitBake:
+      handlers:
+        - warnlog
=20
 Note that BitBake's helper classes for structured logging are implemented =
in
 ``lib/bb/msg.py``.
--=20
2.45.2


