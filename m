Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E56C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 16:22:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web08.1900.1632846147151396114
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 09:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=lM+HImN0;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.75,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmlF6lsY7uVw6CBUv1AmjDhcIbap2uHbNKqPEmkRH+FjAqfMKlvJHIXoVHFfr3/o+0U9KCSWm76B52jZWKwSS4ZXjx4txXeg/2qAwDb3uLo2w2jYCzEQ4oyeFtaRPs2mKX/sK6bR50HgTuTdUNH/jmJUYTchs12qWdD4r2y2+P6XSwsQKqjFlUldrm63VrNnmuIQmElGQewhujMlts1ZOohLrqULCtEG4MuejHzX1MXG8sY5zhmohHu2EST28VaqstETkazxHXaYgyvnFp8dpV4R7+l9mSHUxaSWANEy9XOtPWlMjxyFWMv6ptqLTvx3fdEmm4AaSXI+EfmGCu5aIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4H8sNdTaZRbtN4fcbcYjDLezKpeihpslcbdszv7XhBs=;
 b=CEuBQLdwmmDKjfezHkmPPJ3bRAc6Mu7yLJPyMVidsXhMFGNvCFKOUNQZJQoGZqDwZEmEvH3HeGooAuC2T9oQM+7SDjzbFBnypZ4kxOZPujMkz/JcADzWK0NVsDTTCcfrMzn+Xqbbn6fPELE95mq2bL+un3SJAMMREvnGNpq16P/FxyIKUlROwqrLM1a6cuivUdJJZSKXtuXwx+F502LKJW2WbOgsCh5i4HEcDwfQg4E62FCKgzZ8g4LSD8PfaU4FWq04mlwqv/5vysTY3rDyrsEBPnead1xQEXEzqnlJGCLlS+bZ8nOC29kjw26UFhTcLKzKmPBuyErs1gnt3DRDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H8sNdTaZRbtN4fcbcYjDLezKpeihpslcbdszv7XhBs=;
 b=lM+HImN0iHKAFCpi347aehvXJxwtXz21SNHzbduMeyeVGMg5b7TVgboVYhFjhMY+7V774vDscMqxYKwZ8nnfwtD4hceLEI2+l0gCWGoey29qX7fU+IamgfvJW9DkT98tdlTPotDl1T26QbdgkA8e8Zr6q88oTjeuKwJ04vI32FI=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4978.eurprd04.prod.outlook.com
 (2603:10a6:208:cc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Tue, 28 Sep
 2021 16:22:25 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4%3]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 16:22:25 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: 
CC: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 2/4] docs: sphinx-static: switchers.js: correctly highlight
 obsolete releases
Date: Tue, 28 Sep 2021 18:22:00 +0200
Message-ID: <20210928162202.749990-2-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928162202.749990-1-quentin.schulz@theobroma-systems.com>
References: <20210928162202.749990-1-quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0061.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::6) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 PR3P189CA0061.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::6) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Tue, 28 Sep 2021 16:22:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04503daa-5f64-46d8-bba5-08d9829c283f
X-MS-TrafficTypeDiagnostic: AM0PR04MB4978:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB497874CDEDB2DA95B69EB25FC2A89@AM0PR04MB4978.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+InOZ/vQ+RL5584rH/CxErqeZJqLeF3KrGVMOiKmENriB5GtbsKXKiDYvbxhmenXe2AcSWEQsTiLvqySGemBfRefG/h/jvp/nCNyhCAQQAaUqnkATQtmYY0XYZTEX2zLEEoWGwdiF3++lbeN6nU6J/dT2G2qa6fCgoR9hNh+ZaskI4SgGe+S45W5HT/KrEfYZL4PcUI2DDLZ83ogagKduaZ9syeOgGbsI9ha/a3euhQxM2lDSr7/4vxhg/PHeKoBQUIRa1VrTBRqYOwds7yLgskLlSotlOk7FNitro0R/6ENC7GfGOJBi0WQ5L8Cfhkf7AXwB969vey51lX8tRiEgKfKC5of8FS/7xZhZPDC5a9G40xgiovCoCcQuRp/Bm1IziTGr9PZYx9kpYoTL+JwGoC4PZcTpb9Zu99yDyG9jI11PL//Z4hEV6b1EYoGEDNScSyfvtBqsojAuBVfibpviW4zsORQpt0OK2AXSCUKbSm4Ug20WYW+rMcrkAzoJiCvIX1PC/NywNy7o2edBHdupom0DgU/rCL8rtGGKd0pQUXlRbSZ3NOsEQcxu2SpxVgTjw2JEbZnCIAPBfCz60PI3umt+sOXTcylY3GLIECh1FtxzTRe+dVfTkLXtOXD5CDRWWV1Fk8jDqSjivC0hJvm2GHt4cUUxnzUX7Lhn0gPvZMhgCBiPc5ZFXJcPfWPHvugpJOhtvaPR2AHB9McAsLOCNpRSkIzleuWrHCXGVz8W0c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(38350700002)(109986005)(5660300002)(52116002)(44832011)(83380400001)(8936002)(26005)(8676002)(6666004)(1076003)(6506007)(508600001)(86362001)(66556008)(6486002)(66476007)(186003)(316002)(2616005)(36756003)(2906002)(956004)(66946007)(6512007)(4326008)(54906003)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?602DH+JrSQFPY0h1LCoEz4cjZZOChhJ5r25xLUhbhxmm7auwVxrz4F5vMgtJ?=
 =?us-ascii?Q?BXZPTr+RtYRKCbhNY5m1VnKMtChJOFVq0PSRZnT7LaSolpBLB+j5XFf8IcLa?=
 =?us-ascii?Q?6WluFV0TY40MGLWA+dD3vlhw4DXKAwQgbfv9jqnFidwvNp8sRVHeOgkDoglH?=
 =?us-ascii?Q?tf7gmN1qHmTfcHX1v8+C/nDRKpatmK0RRcj5YHq3qzT2nJtn6AJ8tu6XObym?=
 =?us-ascii?Q?EJCotlm4rjEFHNz89Q3APz0mdY1R4RIVeL4mMEmkq+bpZhtMVEl/i+dON9fo?=
 =?us-ascii?Q?5J78HUbBu8OHcukVrZkkYB6ClZH/TcwsVBOmxBvTCKZaoKx6yTNKsOZElC/S?=
 =?us-ascii?Q?zv9OZD7U+AZ4bBn2hoOmXdo8Ln8xT/oBjnB2crmu4YLmucNsE5ktYIDJcB7q?=
 =?us-ascii?Q?oUXv4GzjjEDo4nV8+Eq5bmGupf2GotInVJGXDgzohfOkPKH4KNDnRWX9xzfJ?=
 =?us-ascii?Q?MYgA7j405p3ZRI4H6P57S1R34CW18p0G2NZZQPmcTsOifDe3IcXLF7KyPj9H?=
 =?us-ascii?Q?QxVDPaJ9BJFmMI2sbg5c3llH2ETOg1HBtEI15Pz0fWcvUDIrWOoPqNAriLin?=
 =?us-ascii?Q?mQdgAU/e0V2aNH0QJcaKWuNGv00NOOg/iaNkVZrMhUJ7Kla7XVCUVBL1n+Ht?=
 =?us-ascii?Q?CtjLXO3mV6mDS4Bc/gS+lAlrRflmV0Gki9bAQ08J4tf0fYQE6dYZfPAgBGAU?=
 =?us-ascii?Q?J/abdl5M92il8M1s5HrEFEDh/c6if8jCUPB1oKtK/aE3gc08EH9Wo6U8JAUi?=
 =?us-ascii?Q?EOCvDQkn6eMjmebNkK8iOnJvUEr5zFaBLmhbyJ6Tx8lxeDGJ0NesHs98lgUm?=
 =?us-ascii?Q?rk+gi9SP0/9YtKMMgTAU4NsFtWCy0JX9ub+gj0BHz2bVneRtah0bk9N8gmF/?=
 =?us-ascii?Q?8DgEU4x6ZmnJT/Z/d/sKOzB+6O6NKufIhLS1WOIQ93sBqrwjeP23aZcabeM9?=
 =?us-ascii?Q?80UTdGKlcVbzOB3ay/zaZ9HHGlfAzgeCs2GswEcZ5YkknOF/p3fGIpHayBSM?=
 =?us-ascii?Q?vIeMbOyvAfFzVESwt9M1zTWbz5Ho4YqBpnY9GzxkxoEhaDjgfNTeU/xFdJ8D?=
 =?us-ascii?Q?jaSHVX23sRv7x/xX33pxiSPaPWO/SuK3XL0fPHmmn5KaanQJe3bAKPNzUeOw?=
 =?us-ascii?Q?pCkHy6vhRS7qunMh0ULSQCG2HMc8y583sTFMs/5B3iywAw5VdxxgmvMm+/DZ?=
 =?us-ascii?Q?B+UTI/McfJk6MI0K8niBZA38grhTT0qH136PeBxNCGYa6U5HGnWMsedsnaK0?=
 =?us-ascii?Q?fmV9RXatLqwiUkrUY0RyRPLH2Y/i2GbWjPyHqSXs1SL2vbhaMZgrtpT/qQsQ?=
 =?us-ascii?Q?jqZu/NwUeICQ6f2n/s6PYTv1?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 04503daa-5f64-46d8-bba5-08d9829c283f
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 16:22:25.2519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zP9NFPZtKEGwIqn2+ECXZlTV+hlx1adulcJ5BDvjq372epv9uvGsB7iINeZ0uhiEaFsVThT+OXyvC7fDszXgo4O50hMMiJ7oNxt9lQP2/nBD9oTT8Rf2HuPNhbpyUXZ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4978
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 16:22:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1900

Currently, only releases before 3.1 are marked as obsolete even though
3.2 is already obsolete too.

Since 3.1 is an LTS and is still maintained, it needs to not be marked
as obsolete, unlike 3.2. Therefore, LTS series are now also tested
against before marking a release as obsolete.

This makes non-LTS, non-latest releases obsolete.

Cc: Quentin Schulz <foss@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/sphinx-static/switchers.js | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphin=
x-static/switchers.js
index cb55e35c8..6038ae065 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -10,11 +10,22 @@
     '2.7.4': 'warrior (2.7.4)',
   };
=20
+  var latest_release_series =3D '3.3'
+  var lts_series =3D [
+	'3.1',
+  ]
+
   var all_doctypes =3D {
       'single': 'Individual Webpages',
       'mega': "All-in-one 'Mega' Manual",
   };
=20
+  function ver_obsolete(curr) {
+    var series =3D curr.substr(0, 3);
+    return ver_compare(curr, latest_release_series) < 0 &&
+	    lts_series.indexOf(series) >=3D 0;
+  }
+
   // Simple version comparision
   // Return 1 if a > b
   // Return -1 if a < b
@@ -219,7 +230,7 @@
     $('.doctype_switcher_placeholder').html(doctype_select);
     $('.doctype_switcher_placeholder select').bind('change', on_doctype_sw=
itch);
=20
-    if (ver_compare(release, "3.1") < 0) {
+    if (ver_obsolete(release) !=3D 0) {
       $('#outdated-warning').html('Version ' + release + ' of the project =
is now considered obsolete, please select and use a more recent version');
       $('#outdated-warning').css('padding', '.5em');
     } else if (release !=3D "dev") {
--=20
2.31.1


