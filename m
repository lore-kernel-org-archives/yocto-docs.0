Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96156C433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 16:22:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web08.1900.1632846147151396114
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 09:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=nYqntpjk;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.75,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkjYuGY6RbZyVC5gOhpjVRRKkzKitGy/fiHxCWVyAIPlDn9M0d/fLFdydnsGubOAX1lfLSPS3xLiXNdtESulaWK7rLSzgY58HphNZg2zQBUqqZISEKkOwdVQ4fok8yPjVDnXgYB4E9ua6Q9A3n2kl914c7WazV6s+O6bUabrkeKhKBQcjxlRte+fOU09JbGC8dH8MSbim3Y0xQVm4/CZCG9IdyDTqWykAH25IW4FxSPFXiq2mmMViC0aPQUP1ivdKBpX/3ikq/UPkvYL8diRP8teXGXOJycIH2gHKnPxmmKpHdQ/WmNXqWd2Q5Fufsbg2u7fRP7XDqRUyVa8tjqYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5yD4tGF1o4Q2Jppynsy2fHWmCIlRA2pGnbRlV3/4fTA=;
 b=U5qZcqxC/zTRHH5aCETE8W1p5XKoQq/uaYCu/B4g3w8FL6avZK+O4yAdG74PqIkqU5CEmZwRcpv8C5dm7IwyS4lLwvty68958gjFtvBF3dI5/k2IFeU7sPBpb9Rz/TL+DuolU6oEuPCSd3ySdNNjy/Uwoycllt0R3jLu3xWgsW/sQCuqFXPZLsREHIsQ530UUqf0XPh7SXYsJW4aPD6E4NzXIq8z/Afu85UPSEJAHyy3r5uL8ggiE2LTyKFa3wEka0N9Uw7qZAoUC18Af/2yScB5lwmRPoeeAT9c9/a8k9tabCF9eDLj9HfhQ7rhD6pxHT+0m5jjq3ANWo1ekMfEOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yD4tGF1o4Q2Jppynsy2fHWmCIlRA2pGnbRlV3/4fTA=;
 b=nYqntpjkXxKKy3Kmp9nTrGKmyrkAEES3VEBu1ZEcm9agf2UE8beMwpo6kqMkHtY4tj9N6NoCge5IZRW11WSmqt79SQ+bPIzAVOOpMTO1jVaicw2/004b3Jd5pdxgRpMrB7+Q0DFgNmOKINpSwh7ll5nuYDi/dX3trOPcoc44o0o=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4978.eurprd04.prod.outlook.com
 (2603:10a6:208:cc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Tue, 28 Sep
 2021 16:22:26 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4%3]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 16:22:26 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: 
CC: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 4/4] docs: sphinx-static: switchers.js: redirect doc series
 links to latest known dot release for given series
Date: Tue, 28 Sep 2021 18:22:02 +0200
Message-ID: <20210928162202.749990-4-quentin.schulz@theobroma-systems.com>
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
 Transport; Tue, 28 Sep 2021 16:22:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbfef290-fcbf-455d-5b92-08d9829c28fe
X-MS-TrafficTypeDiagnostic: AM0PR04MB4978:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB49789BF60908184ED8AAAD1BC2A89@AM0PR04MB4978.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:252;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KtjS+d9K3uc1YP/WN88Z+WK6vSNaPyWbsZMuigYEhMTnzlvBRRlvLFH4SqlzaDELei6J6Q9am40175FPlsJtbduwVqQ5KZTjVlD1atbCgjj7u5CMVOeXbcXslRbv0JGOb1POZsgiwqo/3fiqZKw39yXtjJTTK8k7D3Supw3rw3kS0xhL3fjLk5a2MV46GnciDKmm4MogEQ/u5eF7Hu5GiDSuHAZNR+h6DY/5NqrNmGFUB7mFdFHNCPRXrXqzWd/C8/dvkgkIQ5NxY7KYgCWTYBzBRwYwwnM7ymcuT++rKHX24DgXcTQ+S6OWpCYvvOESFfhihdUUniL/x/YlN2dFfrevDYNjDi/oFKBIxqDV7UUsmjQUtLtyZ9o5J4UPitzNmJiucP1tbRIZ62T9TdllUPdiAg0uYsqFHLEfY3V29FbZ0SteoEkpkalvR/b4jDFsFXCv2n///xHzbjXCY3Gp83PqNNSx1Z010O7AEJnNnMsg6eIpStS/yM2X+2y15AvvdIKO0HO0m3TwhzksS3B6qxWbzsJjA6LGwuy6DpOOKnL3DLHq7RA7M7dQfbfvy3cyc9SU+edXVbk1CEa2AxtqBdtIzdRHmtGKOc8teAn42KoRyKxWfiI34ujsuSyLPQFgfHekFuAgARY6gzbFxJUAgz33SrJeSnZwFhmyH4hj2NT9QyedBJi+YliaIcGpAX8gZYEV83NuKhrBZAKyGCixEWFposWrgkgUAyAJgNtFEgbtpNbnfIznuLJT0BhISpdR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(38350700002)(109986005)(5660300002)(52116002)(44832011)(83380400001)(8936002)(26005)(8676002)(6666004)(1076003)(6506007)(508600001)(86362001)(66556008)(6486002)(66476007)(186003)(316002)(2616005)(36756003)(2906002)(956004)(66946007)(6512007)(4326008)(54906003)(266003)(191535003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?krSxvMscxSulrd9Xj6q1dJwz68MKLgfZ4YSbhT1kUWnslnpuPa6lOSzq+RhG?=
 =?us-ascii?Q?up/cqb6Td2HYs5WRcq8s+xgwcKBhrOs/HEZBhkuKUkSFJVip23ZjHyUDrlCZ?=
 =?us-ascii?Q?bWqFeyDWENGJaIkYFi/1PXOtSw5fhKkByeyKwv25VCrzuxs3ZzqbOHFVFLa0?=
 =?us-ascii?Q?z7IVMv0vDbQJU8eEiArwpZ9DzOmVwInZWwrVHAKIBa+WERCj08u5Vt0FVJgZ?=
 =?us-ascii?Q?cdk6PucDsUwCTpwyx2ZJat+snpaX4Hbu3zyKSpQIpgeWvy0QzAe+X3pcmZjd?=
 =?us-ascii?Q?o/2oP3+/ToBgn/XnCl0SqGg+3qV5ZvEjhxWEkxeaFtC4zWZfW8MSj3Q6zCsa?=
 =?us-ascii?Q?xEUIW6EWC2snVjEGAN06ZHl2nkesnmfGT56E7h3IWix5pP8evBSfirG3CLFs?=
 =?us-ascii?Q?c9n2FVBg++2bQrxbWdb/p5/DJ90fthGMKud3FkTDO1okQTozfpdWN0x6lVc6?=
 =?us-ascii?Q?0Jbr5GHG0gl6nGBSa8MESIzNLq+rEmVhNHEjIVrzgdp7nkvcksoh8Jrwl+/R?=
 =?us-ascii?Q?gKPZ2H072Sv7/NHuf7wWDxd104CK82fLV4CvdLthUfJEcqNHGiQiOrTkaJL/?=
 =?us-ascii?Q?itsmLgUOoU6d3AzZwJMlpuoqcMUb6PvDul0aVF5WqMbzzYkVGaDAewVFs/nr?=
 =?us-ascii?Q?kOcCfPYdXl+hxxT4wl/vOLj1qE2aJcA9Hd8jj41rSd7/jM+QZ0cW+uIB35uS?=
 =?us-ascii?Q?dEPxQjV3gWOIr1redtW+o+txPtVvobsCVN+BBXz5RPkJT68VgSE8VpH041Hq?=
 =?us-ascii?Q?cxY2KXygbUJ6apoLxGTDnLtdyYDPlEOMCNvgcta89F+F2ub6qlrCnHo3ofzX?=
 =?us-ascii?Q?uDU/1hNFYEC+ZmdO/98HvOxdRIjmx7g82NtrqksIKPRl71OSASZAg3Ub65Gu?=
 =?us-ascii?Q?pVT3fHFHcWNSDzYTEDXyhYTppeadExUe44DK/ZkzpJC98HU8FXkidMsk4fkl?=
 =?us-ascii?Q?v4noHy2J02TK5jPLJF9NAw2XDRA+lO4wvmx4/Ymvxv9J7snYzFOATwCm7HbD?=
 =?us-ascii?Q?7uOL3i+1vQA3wZy2dUHjjtegD7ITKp7W0c1E26Cclwqq7QSx6PI5W6eEXs9B?=
 =?us-ascii?Q?Fpwax6z3AyaVq+Is8st3xH7wABKKrChXRgc7yEhAqHpMOBVNBq6HAxtwcYUI?=
 =?us-ascii?Q?weu5XdFXjZKUdSDeIsG9nrOjrRDJeF4775bOUvKZbkfyptKjw36gcNDN3S17?=
 =?us-ascii?Q?QuyfiBn7cmcAjx43ciC09xRyC13AIhbJ1lYCQ9ADu6D3kniKACyGlP2dqe6R?=
 =?us-ascii?Q?ykaASQcgcqsEPvUG0yDZVzUl6dL33NOxH0XFDOBYQbIU63rnLm/f2xT7GDXS?=
 =?us-ascii?Q?5mlPg1B7/GkotGnKYzhQIx2U?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bbfef290-fcbf-455d-5b92-08d9829c28fe
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 16:22:26.4922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IqRskFBUSiZP+lqMu/8mePAzSpu/6NNLtYP9vEydaBrzyzwnWpmus2UQwIZfro5cqA07EbDKgk5TDER9MxN6BQedOhA0wdxSEBEdHC7QYiTWfnokPZjO+D80ixyZtdm4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4978
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 16:22:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1902

This redirects e.g. 3.2 docs to 3.2.4 so that the docs are always
up-to-date for a given release.

Cc: Quentin Schulz <foss@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/sphinx-static/switchers.js | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphin=
x-static/switchers.js
index 35b9a8c81..0dc947ea0 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -238,8 +238,19 @@
       $.each(all_versions, function(version, title) {
         var series =3D version.substr(0, 3);
         if (series =3D=3D current_series && version !=3D release) {
-          $('#outdated-warning').html('This document is for outdated versi=
on ' + release + ', you should select the latest release version in this se=
ries, <a href=3D"' + orig.replace('/' + release, '/' + version) + '">' + ve=
rsion + '</a>.');
-          $('#outdated-warning').css('padding', '.5em');
+          // Redirect 3.2 to 3.2.4 but not 3.2.1 to 3.2.4
+          if (current_series =3D=3D release) {
+            var url =3D orig.replace('/' + release, '/' + version);
+            $.ajax({
+              url: url,
+              success: function() {
+                window.location.href =3D url;
+              }
+            });
+	  } else {
+            $('#outdated-warning').html('This document is for outdated ver=
sion ' + release + ', you should select the latest release version in this =
series, <a href=3D"' + orig.replace('/' + release, '/' + version) + '">' + =
version + '</a>.');
+            $('#outdated-warning').css('padding', '.5em');
+	  }
         }
       });
     }
--=20
2.31.1


