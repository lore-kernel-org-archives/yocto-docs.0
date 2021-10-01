Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF090C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 15:39:58 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.61])
 by mx.groups.io with SMTP id smtpd.web10.9867.1633102796484501071
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Oct 2021 08:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=biTCgpSX;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.61,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7IL8E8nsOicIQSddzwLqFLcsDPIF7mIdL6oGFcOzEwZQKuwKkdChBruHd5WXZ4qMP5Rbi42d/SpC9KZOtSPLkOe94GXa48Mx+XnEeK6I1IegdIpqWQFOCFtqldEAVo0oU+msNh+Tn7nryBzJebriQcBYL2I86dm2Z2blJEKTacApV3EfaE5OxTlTZQTsifcd64ZXVlXXlFmDnHsX7ucTLDw3DzTpBY7WrBTVcsgzsOznUMRQ2AudmWVIm/zxjTiNgpT72Iv1C0uFDuVPUeh2LGEFQ7N7RcF5I1MrtvMcqrmLbFQqrAstLDrnVoy1T90KgHPHx9wkosKdznH1s9fqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUKEdZWoENawoP5iL50jnznPwIH4QLlOhTwhWUs+QO4=;
 b=JskQ80d3BPmSZzDpdLjKxEh2AnBH9aOQCxjOT2psgfOESQ5GVRpFtVZbUFv+oU7rstjHyl+eUTJnve+vDgCSDJSjnW7v0V8oOHzuutZGQbfLE3tBsM7jiYMCmKGqttgi301mlf3Vxl7AH6LMx7EmDdjkxT7f/z75RZ7dPrHTnl4GEnOJUqrmnfoyl5wRKAAFseuQq0lQrAa1dyHa9+6wFUMp39KPHEw2qUnhTKzCpUtNsYqDfPA9yKAPtOtVjHDR0G6x0WxFMGeqha8z0wiL5sX5RCtD2BiSFGrr2kDzTren3YhevSSNE5TwtAkuSByoHFtf/IAC4DSrvtZRhbzP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUKEdZWoENawoP5iL50jnznPwIH4QLlOhTwhWUs+QO4=;
 b=biTCgpSXOjn8LbXzMYz1lB6hXsCwmggQui28VLYCm0s7Z75MTxNe/I7cK7BR+3E4Djet3tOSHxsVEEPFUZb9SShWMmmIGntl2BBuI0q/nhXF/7d68ptKfetNqXozYe6P/Md+7IcYPOb5bIJfK0fp+OV8wxmkcpV0kyWNtN5HyJY=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7153.eurprd04.prod.outlook.com
 (2603:10a6:208:1a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 15:39:53 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4%3]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 15:39:53 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: 
CC: docs@lists.yoctoproject.org,
	richard.purdie@linuxfoundation.org,
	michael.opdenacker@bootlin.com,
	nicolas.dechesne@linaro.org,
	mhalstead@linuxfoundation.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] [yocto-3.3] conf: update for release 3.3
Date: Fri,  1 Oct 2021 17:39:24 +0200
Message-ID: <20211001153924.93354-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0035.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::11) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 AS9PR06CA0035.eurprd06.prod.outlook.com (2603:10a6:20b:463::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 15:39:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78021f3a-96ea-4d59-1dd4-08d984f1b62d
X-MS-TrafficTypeDiagnostic: AM0PR04MB7153:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB7153AE0C1BF250508532366DC2AB9@AM0PR04MB7153.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:285;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DJCHJsDun2cJfNKYqD0lWT9ADn5fVTE90mWo0jDdkzaF43/+F7sKnf6yECwZGqnarJzjzR8JSUIJ3zVlOuQgAOrWikTfIClvV4vONoGI8mCSmq04bshMV2qTW3Lw/WHM+BF4XpeECOQBVxP5xYblsk8XwepdM9KBRdM8EdN88Z8M4KQ0ororbJnaP0KTpVaRWSAlBC8GBCtFU2nDfpnf7+LyY3IRefXV8dqbd1alnVu37LdUsbgcKYcHGbBr0Mn1JSxgqF5d9aXETF+YSC2vwuwY7RqyeS0wPf8w0ywk78RgYWVqfZKgZ/wvQr7xXhAubPtw1AfJVe8flpUJWs0GvvfwrnmQXUNUz5MgSdZGL0KYk3XGMchkuftUGlRlnGwbduuc/mDCGNlHI0JzMbt7k/cErM7te40pvvYLI5S0Sh8LKBNmaRBbXDrAioTD8Blr5wy+wsWfIgf2M7R3agiJvFmylPdV2RR+1zdpIc4bmwEdcd9gHpxAP+trRKLvl3Llvi625a1I3AKhpHcZuL1Kt6WcHJ/FJxMrNNjQwTTLaLLggYPXAN5WjRj2CG6oFBB8z1ghLmKRCgQkky6zCcrAAXbfIdPwZaz3CrSRbd8Mexo7GIH1KqT4mu4voap+fZEggRDQAMh5apnqNDz8xc071a0gjGy8Q+kaveY1jgBxVbdCdVkPk70pC6hmGbuF//pjMEP4w9W8KXXl/V2qrUb9IVD1WG0djYtzM0vaEATPZvJ6UCRB4K0OLx7WUSfD3iMNdb5QJGo1CYua+A+gzW1aUfkUkDXzhewm4ztADPG64wE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(8936002)(2616005)(956004)(66946007)(83380400001)(6512007)(44832011)(6486002)(38350700002)(38100700002)(4326008)(2906002)(8676002)(316002)(5660300002)(15650500001)(186003)(52116002)(6506007)(6666004)(1076003)(26005)(966005)(36756003)(109986005)(107886003)(86362001)(508600001)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EMkgKrwOLVBo2/Aqe5LYco4z+WJBTf0BoibIOPw77BD+fe+F4mfnyh/5AXwo?=
 =?us-ascii?Q?kSSZS8aTnWcr00SyYVKbhTwU042SKQT045GI0ypyGBP4zQXEzX9v98kywFE4?=
 =?us-ascii?Q?IlD7Pb4DQrR727cAHs7F2F/zYTaN+b2MDH0tmX1iibLgD90y+aVzVQaXEoOP?=
 =?us-ascii?Q?DYcx5CxX6KnBaeZFTzhwKQYVxlwWQgH6Ir40UYcV5jIS1xQvx6tu0Xy1xEjL?=
 =?us-ascii?Q?YGEYh3JvDu3UT3Ni38SxFtYGhGfk8/rekyyVwavhmc+8ZHzlZjXuGhbBRMGa?=
 =?us-ascii?Q?LSZf0mfbkcUtnA2+B86+a6aDBJp4wQ+9GZnz8aN1Rctg14qwSPzxoB/nIqor?=
 =?us-ascii?Q?wEn9gA7z/ZvhfgfW0jcig4jnQ0CKybKq5fBWmcn50uYvSoyDeA9XFr4AQfb/?=
 =?us-ascii?Q?7IXR1zbUDFRJvfFhRAEFNwtCK4wObYI9+VT948/S7pAQ3JBK77Xp8eLq5KRE?=
 =?us-ascii?Q?4JzZGk3XpCQvBuqHIiQ37ISE9ZO1p/6hHXi7DHCRnG24EejHQpVBXqDZjIUY?=
 =?us-ascii?Q?32oWwnQIDVh1nw0r0+nphWAwlfdN3uhk++LJp4AgCAIjQHzG8SquV2iSG/fj?=
 =?us-ascii?Q?KYRAMD1YpaWiqXZ6ZP63nBLwGcRZGTl/1+Gco0ucEkTjui5y2pzpIcKBHdwz?=
 =?us-ascii?Q?60CWwQA14z3kE+8fV3fzYEU0EPjHug9bswHOy0BHAkLBxoVA1c3JneXLDgjH?=
 =?us-ascii?Q?CyyR838B31GUVrnDhJiRxsUB1anZ6aOockbG/eBMImmVVHQPU0EdbRZfZV0J?=
 =?us-ascii?Q?zwLu97u77I7VSYnkMlEyHhmIq96q9x+N17B7Gf0Jrl2CyB4wa1u+VbBko9/o?=
 =?us-ascii?Q?mPl7RfRGa2noyCbjJYQQXKOn1LiXxcH5RBjALX8lUHAuXqqElzcp0Rrn1Wod?=
 =?us-ascii?Q?UXeDEXk1XC5l6R3YZOMUGuQqF/go8dK5xfWhNrHaBxTtKDOR8KdTkO6Lj5sT?=
 =?us-ascii?Q?hPDLJmAbujsOeqgXyiHd/mUUUskPZfkmL7IJeI+PwL3QoE+mHZiyvMqZ/mD9?=
 =?us-ascii?Q?x0w+I5k2aWlULhns83ssYddn5o+A4ce7UnMq0vVhA0gujZl68SECgUy5sBe4?=
 =?us-ascii?Q?0iyDzIrlH7bm0DrBFSf/SuoYErc/3okJkM4A7Bf1WzDa0tMG4oSOOSNKYxk6?=
 =?us-ascii?Q?1nCu6IGPncWVoQcBsXV+BVQrtdsh5Tet47znwoKhgS/1qqTWZYziwFp4Yq0R?=
 =?us-ascii?Q?AdyzpgulQ14wRRcnEYTsWJ/luDH6hCQDDAy87GWmpiG2iKMpHgQALaHE2LZh?=
 =?us-ascii?Q?197eU6mga5qXXiyYRTpRf0XUuSbrZYrL4kpK/Ms3UTiTIyFQl2kXAFCa8eH5?=
 =?us-ascii?Q?T3+aYT/UgRl0J66UaH5swtjA?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78021f3a-96ea-4d59-1dd4-08d984f1b62d
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 15:39:52.9579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9xQXLr4bD/5rrPr1BK113eoWZcPYMwRj5lCRFH8g2cNGAM7oVzyvuxRDelRD5qcpTajF/JLFMutth+53d1EhvZugmAudEo/STcc+W6muVh9eMQa9n2TKoRIW63A/gYHc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7153
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Oct 2021 15:39:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1906

conf.py:
* set version to 3.3

switchers.js:
* add 3.3 release
* update 'dev' to 3.4

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

https://docs.yoctoproject.org/3.3/ is broken because of this missing
commit. sphinx marks it as a dev branch of the doc. It also means that
once 3.3 is EOL, the warning banner won't show.

3.3.x branches aren't affected.

This commit needs to be put on top of
0823237e6f4b9dbdf48500b3c1e8cc61696fa2d2 "ref-manual: add mention of DISTUT=
ILS_SETUP_PATH"
and git tags "yocto-3.3" "hardknott-3.3" moved to the new commit.

The other tags for 3.3.x can stay where they are and don't need a rebase
IMO.

This was not tested but shamelessly stolen from
eac8b251be5cd28ebec32345562c838dd5f43b00 "conf: update for release 3.2"

Cc'ing more people than usual since it's quite an unusual request and
process.

 documentation/conf.py                    | 2 +-
 documentation/sphinx-static/switchers.js | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 5a2e25f7b..ab1b2b14c 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
=20
-current_version =3D "dev"
+current_version =3D "3.3"
=20
 # String used in sidebar
 version =3D 'Version: ' + current_version
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphin=
x-static/switchers.js
index 7a4edc9e7..96efab2e8 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -2,7 +2,8 @@
   'use strict';
=20
   var all_versions =3D {
-    'dev': 'dev (3.3)',
+    'dev': 'dev (3.4)',
+    '3.3': '3.3',
     '3.2.3': '3.2.3',
     '3.1.6': '3.1.6',
     '3.0.4': '3.0.4',
--=20
2.31.1


