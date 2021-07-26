Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.71])
 by mx.groups.io with SMTP id smtpd.web10.31511.1627313406006239642
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 08:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=HXaQR3+P;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.71, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaogTVK9v6Up7r69eJnsDb8jDT7fuZGTgJVIQoab+m7eoqYbcPPG6VA75nW2V37SOfZTxj3d+4vTtTf2I/clSjsNo/JILsZs/QC8q3FZDt4LKlVb+VCRU5gU3qBs//M3FjDzO+OL2Ak/vHh+ian4OhN3h6ATSLKuX3VzAtJAK/TWilmrXbWt8ahbDsxD/W7NY9zXslbXHgjROlOiVzfhXASzfQAOHAZ1kjB1gy+HDDH6XPQ2oMHlcoMwrQ6IKtmQzuenTO3MtZ57iE+HuqpteNJv1he9cOHQPRMGkAb8BHnmzci5OusBLcAo++SMMeqUyPIyJiSFrvbw3ZPcMiResQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12hyyYr753a2aBfz5vfQOJ2nN00bRYgR7KLZgjfiCMg=;
 b=YciuRf4/68sRU3SPKe29eK0TWEXPl10rrkaxIR1OmDb7DOsDBXNK6PLp9NjHMNsY2m92I/xWLmiPlr5kUVoAcetRWmzMiVXk2t8Sbk52weYuKQ1gvkJlbFtOj/OnomXPS3ot58QF/GcfJ+P5I0fPi4OnN6mvq+r3BGL+RHKIndHTN+10GxpeJxbHjkSHleFol8sGtbgEnVshBvZhvvt+VrHQqX4eHLvCiUMoay5w8PQp5HFd1NKg4n4N2YVmhWEZ11qwKpXpSaNK1oKby38ZU71R/3qFGyW0z3LVqCJHeb4NeyaKuXQIB0wMsdTBq1CaKperNez8FcrIuwvX+LCDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12hyyYr753a2aBfz5vfQOJ2nN00bRYgR7KLZgjfiCMg=;
 b=HXaQR3+Pmepja46ULcZHYaUuiT6JeNn7wYTXSQJGdyb05d7k4qjyj4ZX/BOBUShtf7Rw9Efe3FP2MdGVE6qpwJqkM40rt1OPAtiZVoAu30Y2Oisb4p2Imyv90SlJSCLlO6GSVuriJki6eExs9rVzqGDXldDYQoj5Tldx5SA/WTM=
Authentication-Results: theobroma-systems.com; dkim=none (message not signed)
 header.d=none;theobroma-systems.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5620.eurprd04.prod.outlook.com
 (2603:10a6:208:134::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Mon, 26 Jul
 2021 15:30:03 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 15:30:03 +0000
From: quentin.schulz@theobroma-systems.com
To: 
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 2/2] documentation: ref-manual: force glossary output to be alphabetically sorted
Date: Mon, 26 Jul 2021 17:29:47 +0200
Message-ID: <20210726152947.2501390-2-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726152947.2501390-1-quentin.schulz@theobroma-systems.com>
References: <20210726152947.2501390-1-quentin.schulz@theobroma-systems.com>
X-ClientProxiedBy: AM0PR02CA0202.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::9) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (92.42.140.82) by AM0PR02CA0202.eurprd02.prod.outlook.com (2603:10a6:20b:28f::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Mon, 26 Jul 2021 15:30:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45e28048-4bda-4170-7e54-08d9504a3d20
X-MS-TrafficTypeDiagnostic: AM0PR04MB5620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB5620451A2B5364954C748735C2E89@AM0PR04MB5620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ojFBjqxjM/7io3PvwaqnKBh11RXKfzTZ7S5it+EUglQAlMt45uX9htWSel/VwhQlrKA7qRfAcrbK4kWjChcPJHshL14IdP1NADfRlRAbZlov7+lMgR+26lOd+hlNNgBe/Z7fnxI2NWHR91DfOkuFAZSLDpCA8ZrijEy4LelI/8+PXfKwCaxqpvHrcgFqalxg5TSFkKTiQs3l/jgBacRW9t+00OTS78xerRr+WHJtrW3V57NO11+GTie6ACZo7e4AaY9DbMpoOCvSjkolgN7N4CK2hXUMND/Luk9TZSbw7J2ZhONrUAWaV0Lri9fb3td7WM950wGsCwMrswojinwUQ8BaR8owTOECtCTWsM91KviBnKUXJn2WQ9m+ZzXJ6XIr+R0xudAlzTYzGOpI5KgyoR90IZkLYtRlekM44eInI+5bzzGm619PyQAvDIHjMLip5BEXrSPEhyZe+ZMR/KEhQOD8Xia6RzIHnQt8sWMsT1ch/3bRh4OzRVz+lhKekmCglhBQV9MUX8tEuZDy+27gFM7bHGYMdsO5+VN2NbrZB4HEI6zVj5gaAxD4SLQT4LyajJVUomVCH9gM2ol+js3ILst76JGjjLypusSFDpPGFCr+zUrfln0MQhFaxNWqHLgZHAeAphEGaI3XJMgua7z8CUGaI9PpgEq9eGngeaav47hyimvzT41+FVWVkCpX3uk4+dKBT/B5HsAg4Rpk8SLaxPlOaQKQKOIbd2hfZcbzAxw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(5660300002)(86362001)(8936002)(6486002)(316002)(26005)(66476007)(66946007)(8676002)(6506007)(186003)(54906003)(109986005)(52116002)(6666004)(4326008)(36756003)(508600001)(2906002)(83380400001)(38100700002)(66556008)(1076003)(44832011)(2616005)(38350700002)(956004)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7ad9MEj88v1TphCU8khyySm3JITfze13+C7C+hpeDKTleVEaJ1dCR0BjmHIs?=
 =?us-ascii?Q?EmTLxye/rht6cNnW2fWVT1kRWrgIM0q/91bgbECrXgbukdw2/kesrBIbIzUT?=
 =?us-ascii?Q?fkLsRzLmnZEeioZmudP6QITLtwXYDc9NmY0avq0BA5m4GDbVcgw6uMRYyjnl?=
 =?us-ascii?Q?p/akq8inUzbcqdq+BlKsr7wQR/hBWo3NGeqqT0VkQFL+5CgOnrFNiES6iX0I?=
 =?us-ascii?Q?7/WkNEVyQPXSzgEpxu7saqRW/5T68ok1BVNg5+7zXNs8NqNYm46dtSTTr2QX?=
 =?us-ascii?Q?dAdkcLPHcOYgSQkI+OGna2GHMaDuI/8V/IyVXcw+krkLCMienrsIA3XLi6wu?=
 =?us-ascii?Q?Ut2Ag0fILY3a6Rf3mAaTjn9tErsJf/4ATL2I6IhCINueSLag8zDKoWTtcpNT?=
 =?us-ascii?Q?2WTRjKyzNCHklAr6mANtGamOGTOc7Nyo2mg7GCq8i8UDfj3C7N1tWkrkTSid?=
 =?us-ascii?Q?RcRKlW3mUWCJjYupAVetCPaSJ5hzZd3NOgRSe1rxqVTaVGgpOSKb8Ds/dOvx?=
 =?us-ascii?Q?pYX5gk5LDGVxyWRCgpW6bQopWN0DWlOBsI5oOOvuyowQfl+PF2HvzK/90l65?=
 =?us-ascii?Q?7TpaRDjUhSO3nZY4+e1RSn6HUUn5xXM0kLVLsC6tSSaIzAggj3opG/3N/UXG?=
 =?us-ascii?Q?QNluuGyAknbxrczuYvcBo4d8qG/bkJ7sQFs4K99Aw4OFDwI+htnxV6bFoIPl?=
 =?us-ascii?Q?gXAs+zvJvxD5nCZKs2XnwTiIMpKDT0u39ESpEZt2ROFSDuJjeM3KHHNtsuE6?=
 =?us-ascii?Q?hvUFeFWFY0GMk3Fctw7su6eLGxL3ud+jsjxj3HHthYupTn2i6ahc2j/ZgWXW?=
 =?us-ascii?Q?Z6DbECwzaKrYlYc8jKtFCBycQ99lQJVqSylKbelI7VMkPS+Rd2WqHZzNkuv0?=
 =?us-ascii?Q?f4u/8pVHVkRAOesx7xIE0iTKFaYvNnlhBN2zWVLiuBi9BftmG7xxc3L/rLcE?=
 =?us-ascii?Q?lcjPDonieCWv0o445K5rJzkw4kDdM3Dj+0yOB4J9UDdLTqtMbTrm1I7WA3Ze?=
 =?us-ascii?Q?7XqhXKFs3XnpiKXZQD6wvQcqVNmn9NfYm3eP9TJdbwnACc+asN1GaaehI6+S?=
 =?us-ascii?Q?YTg5RpjLP/Hl0gBqkESF+TaSqIyxIUvLmDuXKe0Rv55one3maEtnW7sCZ6Jd?=
 =?us-ascii?Q?jiusgjty/TJB4YnG1lKkK7R/YXe7x4L60pgAP9gYju8PXpMMTzzKCceyZ6w2?=
 =?us-ascii?Q?HNpq5ZhcJl0OL13A1kkiW98et/Tej8um3qphbHpHL6V/pGPhYNeYrK/fRJsB?=
 =?us-ascii?Q?b6SA5GIiJW1qizWXiiKO2wEEAbDDDer4hoFh8u4oA2gkhlXYo/mOUCeXStt5?=
 =?us-ascii?Q?qg4wdp6TpU/KFqV659xaHW0B?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e28048-4bda-4170-7e54-08d9504a3d20
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 15:30:03.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkIZ14qO+ekI6DC3VX7nRBw/chDUV6EMg7NoSu846DyiCo8tU5e+V42s4A1ZH6VCjYX3z1QwjYWZbp6RmHG9j/KEDogwijDN3h6VK5LF9sXoUPOIhnJKj6LUA3jqz1v3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5620
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Even though, care should be taken to have the terms in the glossary
sources alphabetically ordered, it is possible some terms might be in
the wrong place.

This makes sure that whatever the order of terms in the glossary
sources, the generated medium is correctly sorted.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/terms.rst     | 1 +
 documentation/ref-manual/variables.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/=
terms.rst
index 545100efa..4d960393c 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -9,6 +9,7 @@ development environment might find helpful. While some of t=
hese terms are
 universal, the list includes them just in case:
=20
 .. glossary::
+   :sorted:
=20
    :term:`Append Files`
       Files that append build information to a recipe file.  Append files =
are
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index e5525e922..220e88db1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -17,6 +17,7 @@ system and gives an overview of their function and conten=
ts.
 :term:`W <WARN_QA>` :term:`X <XSERVER>`
=20
 .. glossary::
+   :sorted:
=20
    :term:`ABIEXTENSION`
       Extension to the Application Binary Interface (ABI) field of the GNU
--=20
2.31.1

