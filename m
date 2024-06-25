Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9C0C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 20:11:55 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.132])
 by mx.groups.io with SMTP id smtpd.web11.7099.1719346312228565885
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Jun 2024 13:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=IpGKcCuX;
 spf=pass (domain: navimatix.de, ip: 40.107.21.132, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZ9g7sRzh6v5jzr8TE3XJ4Rgiz1mJLc85tKSEJba+nyyMtvgqlOtXwYzf1CKSyVf4pgw0LmJH47kzPkl9Yf4Z5zQ6lzT06tE7BSsx3WqQv5heX+J2+NT8C2ZWGceV8yXFrr+SELg5+y55plgrZboLEVvu6OvmkSTx4fYsyh0cR7OzBWXta5sq47H/aKNzZzQBR0+r6sJcyVQIJO+7T4o5F5AN1pANLpqMnNuZJRmPge7dHszfdDLuJ0LuRRalk1zGVPODIgen/JNEIQJhWTA35CgnBwM9VhF6It8F0+DTTdPLMd4dD5468M55wRM4VJtqWEzOmDYfS01DIGEjExyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efQdKw9XVc4TuR1gP0TINSZgnmy0JU4jd5ApflMiFNg=;
 b=E5BY8amLJia/GG8M8ZIiWzB4vxvhgjlKIeboaqG1xpspKPNWh36ePpU272VntzF3vvlaP4tlEQaFwTF1Uzc9XnNPR3GNUTiSuW4goP6CFWXHPEsiYgUpKZZKvLihZRgNSD5SZNWVx/TA8HeVVwfd/F3sXxJkgVv1tSK/rLxveD97AL3zBjXZzEpeEXdHVKcvQck40lc8Zg9e1rwIOs+RSSsSS01tav1XqEiuz9l4cP9wjz6vnwOgDelX4/jJh6wOGDev1Rcbweblp5GMqkc25Gag0YH/P49iEh5DCdR1UleqyqhCH6tgSt9XATFsJjDrCSMouhH+hxNVYRhzfyMhsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efQdKw9XVc4TuR1gP0TINSZgnmy0JU4jd5ApflMiFNg=;
 b=IpGKcCuX+O3b8zhPS8HV0y+MaXYFcqLRgfMnAMCpB4SnI8ogZALjRbog1lXWPBE+g8e1wk+/nz8RFDOtK1xTgA9SBJByRjCU5BK+W/xpxRFb6JWEyfuWeOxGzHUIsZKQCKHlEjqVsmgWA4Xk0G0P/ak8LsPz89RANHmkWArPsYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB7221.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:257::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 20:11:48 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 20:11:48 +0000
From: joerg.sommer@navimatix.de
To: docs@lists.yoctoproject.org
CC: michael@opdenacker.org,
	=?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH v2] ref-manual: add DEFAULT_TIMEZONE variable
Date: Tue, 25 Jun 2024 22:11:28 +0200
Message-ID: <9df638ebdf30b32b0817a357547adc01fe8a455b.1719346288.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a782759d-652e-4d48-be6d-e3c25fb06b47@opdenacker.org>
References: <a782759d-652e-4d48-be6d-e3c25fb06b47@opdenacker.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR5P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::10) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 578f96fc-f3ff-4a07-0d9a-08dc95530aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230038|366014|52116012|376012|1800799022|38350700012;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hdmuwYeFIY2ZP1/nvL8TjG4kDdrP1ZMK2C7hJuXVU7hbh1lZfguafaORQoiV?=
 =?us-ascii?Q?jQ/ylghAtGTxjIZEgNfZkt8OziVD44FlGoKufR5mLH64ttRo8xqEz20W594S?=
 =?us-ascii?Q?5FFfqZJ3goHK6yLcGvz0hZUwo+UIHSFTkuUyoIZ+T0Kqzd/un1FyN4m6XJiB?=
 =?us-ascii?Q?85tV7hJ0FS4hEiDqXqk+JQEpd64UB6pUG3QqdZQ0WrrMACP8fdUw+hLqaOnq?=
 =?us-ascii?Q?9xvW9niPEuMV/MaaFDB7dskwXyoU+UQVQWAzhflInpDVGRYMP8ZWsS5Rdi8v?=
 =?us-ascii?Q?zRV4G6uCZC0mkKPjSkUCdMH5K7+0iRjYhk2fJbYzncO+YiH4nJ+jXuSCpmN2?=
 =?us-ascii?Q?4HaNvjT+r7pjxyklS38WnWQZvGC2imgYT8u73SOTD8O12H/J4kTowzFf3vTo?=
 =?us-ascii?Q?5HwdzV2f+CnKNCJpyyZdVcLqn/lhCQ15IiiuJq7fBrQILuZkAYkjmjoKvnk7?=
 =?us-ascii?Q?uMYtfEninG32nSznPx2K8kGa2rCauxFuBbLDZP15iGe4B5UgLVQ/tSjhad4n?=
 =?us-ascii?Q?wdKLa9aApNdpqioS9QhBGvU7YAjVPyoD70O1ZbxDgE4p2+CCYMbPP97d371G?=
 =?us-ascii?Q?8jrjzlDMeL5cNTW5FJZgn1bKLw0niwOikQ8qFK44rkmUs3aOCS5KlxxEwAod?=
 =?us-ascii?Q?1p21FGDFr/tJcWeWXDbqf7Ab4RGCnDQzPR6+g9y/hHjqpGH8N/0iG+Mwf2of?=
 =?us-ascii?Q?Y6AICL7o3Fj9Wpx3mBfiB1FGAYvTUwXnDnfKhkVU+KUNBtj15rnxFo8T/yFl?=
 =?us-ascii?Q?Oh50DHKuw3S7w1GUWRkERQFqltzQCMiLBT5hRfgc9gPgrVBQAyKQXqj380Qj?=
 =?us-ascii?Q?1+5ma6OK6Z/V5hYCdL/5hY9G/vo17LsdkzGRv+Mjjhqqp3eGRKiiMs3uGl6D?=
 =?us-ascii?Q?WNf8Uk9Szj/Oz0EeeX2um8CV+8j/XOtabUqNnfJBx8F4Bq6paFoo47Sf6IUP?=
 =?us-ascii?Q?mzXh4BEQKhNxdsW8la4llW7dE1nWV4jqUpime0rV7YmphLQUBHzg6dYgLc2E?=
 =?us-ascii?Q?+7DahTdOqf1gYaIWmxaPcb1UntzR7LVE+cXOSQnH9uGjSF8GUlUkIurHN++f?=
 =?us-ascii?Q?LWH4auZ9b8/fyyng+xYdkQibQXepzPTeJ4vBi4uYqfVkPijjatA+FWlujsGz?=
 =?us-ascii?Q?Rd92CDPW/oxMV4GBjsgf9tYIW2TXrNbhF69g5SwsHDIkvyX0//+4yiSSbHZg?=
 =?us-ascii?Q?b8WnoHODM+yln61Rm6b4ilbIWLrmzJ1nM6lYbLo5gFD2YTj+grARjdm0LMJ6?=
 =?us-ascii?Q?k8f3AYcKh+zBkmUNsnpShOdkaFE0NnhGjmaEpEM2RieT7Diuk5Pa6C7G7cAE?=
 =?us-ascii?Q?7UN4Ru34DeXhtM7gv5zlk1gHs//cVv/g2nNZvXPU05Zp1O9XsA8UE+zXWyKp?=
 =?us-ascii?Q?a3nKiaw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(52116012)(376012)(1800799022)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YowdtGx0Ra9ciVcnVAB2YmHCRlI/ts2GaNQRMpWolSuPSRYRBfhoKW0A/lpz?=
 =?us-ascii?Q?a7myQrnmMfvbw24w6NnmURIKBujR+ST24LiLX04+xpcO0DTRoOkNho8R9Dhl?=
 =?us-ascii?Q?UWpARDhFx21JosaiM3CSVUrd+Wo+fejhPqOfcTmuJOywKvFrmVn7SOZn6WE8?=
 =?us-ascii?Q?JH53YXIxh3lznWdUEtePA8vyqY+bxYmXTL/jtmtVn9dw8dmOJXY7cTmZGhDS?=
 =?us-ascii?Q?6ryFL8FwrS6Fx6w/Jg96S2JedpJ7HLK0UgDyNV05O5DJ+FHJi61wlMRECGP2?=
 =?us-ascii?Q?1PROoSJxZJDU/0CDVR8TEK15+Acolz6h+alx8ePNMG6ddj6laPjyrZi04d2r?=
 =?us-ascii?Q?IiAljuz6GfOZ0fpRCxB4Ef5+dBWJMn5INEJQsY6AkVwEdt6n+pLulFw9rZB9?=
 =?us-ascii?Q?hD/W8f2XgG9vhMu45SzDkwurW0Ypq9P9BmwptGucIaBa0S/M2dSjuU6zbacp?=
 =?us-ascii?Q?064kC6waXaF7kezR9GZaJ+Q215o0tEr9adj3tJOfeAPOW3skPkB7ieY3dvgr?=
 =?us-ascii?Q?pEDeMA6hE2lrAK8AzRi06EnZ3bXZ3lR3zXneEVxZPu9v1e3AXAVYrwHAHEoJ?=
 =?us-ascii?Q?GNVg3PqL40Swgg4ia2lJ7+i3sGQOS/WT7bHjOsG4m/a4BH+qktKnTNlZnHC5?=
 =?us-ascii?Q?lhS27jZC1lYPDm+GeUJaVzU9rlI36j2rusmruvg6MOhy1RPqmHWgYtebV7v0?=
 =?us-ascii?Q?xCpPebf18cz5I2k62u6NaBJM/N/UiynigN3XMrL/GKwLL6ZmKhFS317/4iFs?=
 =?us-ascii?Q?2b19Tb9EVJqvR2mmuXQfctV3HUca86js79teVTM9IRPLXBC/QmGgJTw0Ju0m?=
 =?us-ascii?Q?MCxVC2NbhudqwAHJsMt9YY7AGW72uWROrqm6Q7nosVeIKgmJa6dwLf8EHMea?=
 =?us-ascii?Q?nQX+nlG4AnmzniJ5FqFbopkEj3EWvip27xOyXh8bBJNdRpz6D9RS5dIIYpaV?=
 =?us-ascii?Q?JySrBHnPW53q/kJRt84d+9KMcdLGGvFz3W0wRHNsWSoLv/nxr3qz3rXSgttD?=
 =?us-ascii?Q?XwJ+pNYPP8FOhtclKe4NBDHi2KYr8olU7SLp5CJMZ0+i5+1yaXxuJwAR5LdT?=
 =?us-ascii?Q?tJAxcpQqDkZ08F3f6dknsdXEMY1LyZIAYlHsnKtNl03doloM9oT73Qe6firv?=
 =?us-ascii?Q?3xY0B16FXvoCHC40ND8q71ro9GZOLynsL2PfiPjxVkt9mnb/AuLxr+VNc+yh?=
 =?us-ascii?Q?ro9x4OFSTMmRyh1ALUmSVn2yo2rRJr0WEC4HUoSLcydCntFk6DPNkKyNY33U?=
 =?us-ascii?Q?pvEzEM6n1kvoy3y7dp0I4LTci39iQH0Ufurf9vCuSuznB+ZUEkKmW7gTK6kJ?=
 =?us-ascii?Q?93MaQJfzINzeEfo3NkNf826HIxNXN8TKqZYj7sB00rYxgph/TV6in/7kQS+j?=
 =?us-ascii?Q?X+o0HR5YHXW/4S2vVJYAVz0K4xhhUuq8ad+xCew43y/besXv/dQAXtxLdg7X?=
 =?us-ascii?Q?ZvS/jr1NbT70cWzXrITsLw7cWVHgTrS8ww2kuH6lTFlDHfNKT6LXV7ZTMyOl?=
 =?us-ascii?Q?C8x1HitpfRBk01dlL5gfeQ2IneHw3xLE2XphMl4gB9SuCqZuLKiqUoooDm8R?=
 =?us-ascii?Q?bEdYMLtj74/jmLJy+gHTydWvyciFxMj7ZRqc1PlrS8NJFOm+xZtZwt+hf70m?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 578f96fc-f3ff-4a07-0d9a-08dc95530aea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 20:11:48.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: queqqcnMbL6a/KlOQL5P376RTK1DKVvRkXEewFYdBaNk2qlhz7UgPzepH7Mj4V1XzDcAohBv/53k99iQJ0XO1VDZ7vlOE28uAKLn9PrP1jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7221
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Jun 2024 20:11:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5306

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 16b449d6b7..848cea787f 100644
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
+      This variable causes the ``tzdata`` package to configure
+      ``${sysconfdir}/localtime`` accordingly. Valid values are all files
+      found in ``/usr/share/zoneinfo`` like ``CET`` or ``Asia/Baku``.
+
    :term:`DEFAULTTUNE`
       The default CPU and Application Binary Interface (ABI) tunings (i.e.
       the "tune") used by the OpenEmbedded build system. The
--=20
2.34.1


