Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC865C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 16:22:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web08.1900.1632846147151396114
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 09:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=mSXmx97V;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.75,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qqtp3/XlkSzIZLLckzlF3WLOjGuKdf/DLzmi3CDjFwoPmd2AMh3ju8pScPTCpRe/WALs8NxbYZUbR59T547e0UEw2dtQdwdrhbliAQlb/Vnp5IVPMKKJ65jNIdH+FrRo2MVsySD+1RcRbVjHFGEJbb8AogrqMV/6d64cqtPRNeO1h4Tqlq7d528bo2yB2xOU+rUV2XaFyHP7L6TRSoP/97EVLddaFiqzZTZYvuCMFG6R+vXHE1BCdL+iBAD6PNJ0muB61VUqu86HdOD794WPYx1xEqerbSrgfqmmZA5Hv7eDwUsicjd2y3cyhle162iqMnNLSJf3gIYBokZo/nvnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Xb4p3MgkSrgd4+5eqU+qmtN4qDceH+CDaq5XKlgE/eY=;
 b=DIXtrbC+SVKfl3iBooqqnjAhU9HT0vGFVfrI/2eTLpCOwg818tW6B6cXCGbq6QlY2/uUYytd/5qwpvOENrLBSgtX5CEKI95U9pyemds8i3KXA1nGTLI+LNZh9X+hQxXLfYDNCUIid4rPLkRlG7ze5MO3ryq3TUSf9pHGreACHS5YaQwlrKq43fhYMabmdwd3LZmXhdwW22ocWCyBb2wrYNWqzFa6l1q96w7H25+IAlx5qRlU42HfBF4IDEocaAv61V3beP0KIYY01LJK85IjqTO9ucSVW73O2b9dDG3+fwVJpGOYNAvGC+OXO40+rgE9ysXNNbZ8CtVzZY+3Itm2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xb4p3MgkSrgd4+5eqU+qmtN4qDceH+CDaq5XKlgE/eY=;
 b=mSXmx97VZhlxKKBYlp419PdBhC8xGH5etrkodFfUpagQmhk4MN8d626vWXF1CMcJ8Jcwp/zyr6NuBuNhuBthQR8Czo4+vHMbhvHyFuV7hrFENwL9+k6HKVvJT86vR61lLbIHUVfsXpV2QKWCj4ryf8tna4mTqTI4IWIia6GKeio=
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
Subject: [PATCH 3/4] docs: sphinx-static: switchers.js: point to newer release
 in outdated warning
Date: Tue, 28 Sep 2021 18:22:01 +0200
Message-ID: <20210928162202.749990-3-quentin.schulz@theobroma-systems.com>
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
 Transport; Tue, 28 Sep 2021 16:22:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a10199fb-8881-4386-d67a-08d9829c28ad
X-MS-TrafficTypeDiagnostic: AM0PR04MB4978:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB497873762B19CE2E4488E4FDC2A89@AM0PR04MB4978.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:216;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7YcomC8q6uQHzTv6FVA6tqCr1E3a7OGQFKtqXWI/JeeXWGulHX9fuurQFXaISxZM5Pq6KWnLLgRsRrtlF5c6dFOfTr2qzrKqrvl8xtIxdnCP4INZ8+jw/joOLFXyhGLk4QQEy3dm98I7rewO0FvBE+JYmXhzQd9rQR09oiVpTqmpskTY3Jkyv1SOH65qYbQeSbY8PJLAMs+nV4AxlsozPmXBR9U1SqJwQy1onrX5fjliEvOruvMimXBzwZApJxre/QHSojTeKoPgR2E2bgFQYaLUP4wVf3s/4FyiiKDRsKLnIaj9cgnI7KHJZclwzj3i4NrMPv2pT8HrrWVH/iJw3wJG76XWOfH3gE9Tn70mcCiI9V+cq16B0ki4Ww6XQLtMwkswpvumh/RJqx0Kb4VkmZ2Fn3x3zDOe/OGT4KTAH1ousO81jn61/q8wuQSUABgv5SAA779WrUBNm9i2KntKfNa8ImwlG+EwusOvulNi/c74TdRE5mGQ2g0Z5IvT320ZaJEV7y89V/zPDgPx6sB6nK5nk6E5hmJoRpB8XrF9BKLVuoyHSDLrNteWpZvyA1bOv+q4HugsBNHLiUSVBYMZPHh5WnJUsE1+9bnQ1/S1Htq9IqgMkVEAhqgpLea0Qx6hGxqrkScNWTii8h7pf/R8p3ZQxDiNwiq/PHf8w1MsC2WwAiXzaENke5Yu8Bk7TVnbp+pC1jzT4VwY9Fw47IYDfduJmY/6a+yX2N6mbvScrwU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(38350700002)(109986005)(5660300002)(52116002)(44832011)(83380400001)(8936002)(26005)(8676002)(6666004)(1076003)(6506007)(508600001)(86362001)(66556008)(6486002)(66476007)(186003)(316002)(2616005)(36756003)(2906002)(956004)(66946007)(6512007)(4326008)(54906003)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zQ2+kh0Ug5LzTAE0M7r0k4ARfwdx/IHgDvpV2DVGpK59RYyB8xaRzKg571ey?=
 =?us-ascii?Q?HKGjTkGo5mdbhRi/EwGTK87plScR/Z70YR74KuSizpvkzN+RqdIc2u6/jbyO?=
 =?us-ascii?Q?BN4Xl7FWG9swgNIRi6VcyobhnzbQoU6BhQj81bu6+NCo6VnNj3KvnqAZJFEK?=
 =?us-ascii?Q?oicmuYcXi1Um6PXeoDWccZHj8xuOiNWuJOsdSIR1UK6YpxV7jMkTuYj7aRXb?=
 =?us-ascii?Q?e7t2n0m6INtPnuFGq07SE/MGjbypRYJ0fCZhwjwbyyOf+sWJLag2lRbxvfg7?=
 =?us-ascii?Q?Sr7s0nuTAA4wk9tKvJHUe1dqT4iAHV8P/Gt9F13syAKWVSbM3gFzd290Axs6?=
 =?us-ascii?Q?Dl3NoBLuic+BDpzChyyRjbem0fc9KciBtfaRtfH3xsi/2ZqkoPSPb6G7IXbl?=
 =?us-ascii?Q?jaefgtbl5VPQlLaJBwd1wmcf8uxoNFj5ZiP2nMOYieD/ihUMfyIZLB7YNsJN?=
 =?us-ascii?Q?EUyuB51v5LANhJTRx2QikjbgYzH5DaWqRf8p47IVYgtS87D/ZhKcNPCvDzSA?=
 =?us-ascii?Q?e9vXL0dLLAD0t8wQHHOMgAhP/UUEB54VrPlEGDXKjKkhpnpHe8ZzXUCnpomW?=
 =?us-ascii?Q?+Xf83KPVNl4VrMKCwaeC8x4l0tSma5iE28CsKKCW1xO6yyPyzvAUw/YQfX9o?=
 =?us-ascii?Q?/KpbIqsnZGSL7X9cxY8j75knPy2WHQL2YL+zPoJvA4eUZ67NWhcbcKe6rv7d?=
 =?us-ascii?Q?n6ElXceJR8JfXAFywPEmVQgZ+/51qxSf0aONogj4ePOqx3t2xmsh6CRUpxJO?=
 =?us-ascii?Q?d+5jt9wvwTKv/IdeWrL58/E1++t0m/5+caex5ojOOs22MGyUPWSND33zi2HW?=
 =?us-ascii?Q?9r+RNAo1WwPz9bbmBGuYA8Nl01lXZzgTRMVlxtiThsTB3vAD8ePwv2NSrejr?=
 =?us-ascii?Q?RX+bVHGULzV/qMits21KXX28sb2E1OmHSG8GRC8dYveo7PGVl2gpGuvULjpb?=
 =?us-ascii?Q?ms0DL26mrwMRXwBJQ/qWYM1cuhiVR+rcI20Vwu21Rhf8WAcKGg6PB+T6VyG3?=
 =?us-ascii?Q?s5whnuA8oN5aZMm4ZsgYfmtkcbyGA8AP1lpCrDmYD69+A7xd0FhDn/5DVlbh?=
 =?us-ascii?Q?e3JddushNpdIS3AGvM/7oBo15FOURcgyJ9dDLzTAnlnOyX2QtA/863fa2gO/?=
 =?us-ascii?Q?r1glsjEbc86a+vyCkctJG7+40gQhe6EEbAP+FLCoZ7paeAVV7GoakC+Lfmgc?=
 =?us-ascii?Q?HhPft/1mfFV8YkaBNG8BADA+/bFAwQTNJQd+a0p1nzK1SJoVZI9RZVdU0LOn?=
 =?us-ascii?Q?pA2SXInlD4biKu7WgiYTLpE9t+f0DGzjClGdA2lsqF3mWfzVJ6L3PMCbwI7Q?=
 =?us-ascii?Q?xB+ooYpZfEuXFA+rHs9rONVg?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a10199fb-8881-4386-d67a-08d9829c28ad
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 16:22:25.9935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6Y9mzD4wPlllfMx3o4vbpnh2p8sUN2SWoBsijo3LnMGiUd2Ac7JZvxZN0E53P7Tm8wMJrP6GLRwbOctR9X75sKrufz9vTUCW9GBvKfXfIpUiTTQxkYDnbD3Dk6nGwQRW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4978
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 16:22:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1901

Cc: Quentin Schulz <foss@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/sphinx-static/switchers.js | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphin=
x-static/switchers.js
index 6038ae065..35b9a8c81 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -221,6 +221,7 @@
     var current_doctype =3D doctype_segment_from_url(window.location.href)=
;
     var current_series =3D release.substr(0, 3);
     var version_select =3D build_version_select(current_series, release);
+    var orig =3D window.location.href;
=20
     $('.version_switcher_placeholder').html(version_select);
     $('.version_switcher_placeholder select').bind('change', on_version_sw=
itch);
@@ -231,13 +232,13 @@
     $('.doctype_switcher_placeholder select').bind('change', on_doctype_sw=
itch);
=20
     if (ver_obsolete(release) !=3D 0) {
-      $('#outdated-warning').html('Version ' + release + ' of the project =
is now considered obsolete, please select and use a more recent version');
+      $('#outdated-warning').html('Version ' + release + ' of the project =
is now considered obsolete, please select and use a more recent version, e.=
g. <a href=3D"' + orig.replace('/' + release, '/' + latest_release_series) =
+ '">' + latest_release_series + '</a>.');
       $('#outdated-warning').css('padding', '.5em');
     } else if (release !=3D "dev") {
       $.each(all_versions, function(version, title) {
         var series =3D version.substr(0, 3);
         if (series =3D=3D current_series && version !=3D release) {
-          $('#outdated-warning').html('This document is for outdated versi=
on ' + release + ', you should select the latest release version in this se=
ries, ' + version + '.');
+          $('#outdated-warning').html('This document is for outdated versi=
on ' + release + ', you should select the latest release version in this se=
ries, <a href=3D"' + orig.replace('/' + release, '/' + version) + '">' + ve=
rsion + '</a>.');
           $('#outdated-warning').css('padding', '.5em');
         }
       });
--=20
2.31.1


