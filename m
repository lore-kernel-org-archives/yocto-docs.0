Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.59])
 by mx.groups.io with SMTP id smtpd.web10.31604.1627313755447824358
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 08:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=thmeuNlA;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.59, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnLlokT6z0q3XlNQVZfogJZ2oNdgxdSnTUFKt5NEMBXTAzUOz47b5rN8Y9kX/xLGvpa3nEGk38Cd8XegtQWreMbXGx6FVtbr1I1vilM4wyxoHFcdxfrBQ/Dl8SOoZ3YZ6rx+3PEw4eq2mU6UpPhE2btyVC4fYJttbQ6MKcHfgUbcx45PDWJdc8o+JuZjlNFeJjXdFd53srFfPeYPYK+1RAfWRysgqFaK4iRTeA05BfNucf44WZcpJPAw344ji8MoHw64muh/Q964y7je/1/VsAsqY+vbh7Q7ZF1kJ1u8+opifrcpIEIeM+gZ97kQlkFlch39kZA04tUCKbS871E9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY2IhxvN729hZPwGRyFnTKGY3QyE5U6/p7pKhC+ZyHY=;
 b=Y1P2LxkmopnostR2oOfWxV5+aF8uQXxFkDcgTOhZ3INgCHnTlmb0sTdChktoCDMezaD02OUAivheQfneyToqV9YQ/kSl8JXk7vL56MT9LUBU0vAy4vaKDTSsUCsT0/Qv1CX6Tm9gXen20LQekUolOEWGZfQr38z51kBvl+9HyXA8qdbixnsL5hPsxXgb5WdoE8ju1U10u4H4+4H9k4zqv18G6HjkjUmw7TvJ8D69bhYrHAiJKOBDxHJnIXa+ewP4Asi/F2+cUvAOYS5eltGKe8aWZm2Uy9CntxCZxVV46xcFcjyk7L2cmRmbujzMiMdKwmPw49tTupP3q5s4EQIr2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY2IhxvN729hZPwGRyFnTKGY3QyE5U6/p7pKhC+ZyHY=;
 b=thmeuNlAKRGvkpGzEhoa4g1NKHFA2HQnua9r2ruVqIOSS05Apw1MfcDpVPpSf/p4RH1huKQnw+fU6P3f7BQyvt4woFmj5D6Y7SfE2CAmraB2kkCiWeZU+SwFSVOj/En8HyD7Q0UmvtlMeaKwy4dSAHxm90qFD3VCkLW3w+WGLkA=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7412.eurprd04.prod.outlook.com
 (2603:10a6:20b:1df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 26 Jul
 2021 15:35:52 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 15:35:52 +0000
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: 
CC: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 1/2] doc: bitbake-user-manual: ref-variables: order alphabetically the glossary sources
Date: Mon, 26 Jul 2021 17:35:22 +0200
Message-ID: <20210726153523.2503355-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: PR3P193CA0024.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::29) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (92.42.140.82) by PR3P193CA0024.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Mon, 26 Jul 2021 15:35:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 883e1578-5e79-417e-1980-08d9504b0d23
X-MS-TrafficTypeDiagnostic: AM8PR04MB7412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB7412FAF3E282CC9BC75151AEC2E89@AM8PR04MB7412.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y/5ivNAqddbTwTIkX2RBEtA3o/vrn9OfEzug37293bJPLOvCE48R89yBsHpxbLZpMGf2O9J6u/3zijQrYWtqDAzJM0LYtDvGonaNYhj21Mm1KryRZ11PvgOJZgWT/nh7IdH1aBp1SGn/VOyfuJcSoOGY2Rs6nuPNRNGV1iASZ3JwAXyuPFWHHwNA7Av76+YVpU2mkkOA6lx1ZIYmEiUZDbkel+oqm1sygYX3pskMj88nroViNy2zY30e2fmQsCCLwelza3L8j6NUP9RxYZtk6I8c+pV+ILT/e6rnT5bv6KM4j0RQO4+BONvMCnxbJ9wawYP1uP5AZo/CGw/lWguJKZTUucSfkkPPjXkIa5ZCpTbm6Z3fxkIV4HTS4rHUATr1hnEjJzMK4d+9doa6fNmJkmwmBp4ir7tjrVEDDKVzLPQwhfdgb4hO7CVGNm1XuEmlsuKuP+ljvn8MTh9dXrJoK4yWL/0OKrt1DE5PEoXzc88qXv0zSQGLXJf9KlIlEmXNBaFJRdecZQbpCWn+fGFtfjdtOrrG4U1eaCyZfc0LCqkuPgcqknKa8wn80tsL6ABCQT9gLjxGyzuOpQRo5tLWyYcjOMIYYiQ3MqVC27O9f/zl5qMPfr8VpgF9x4UpAPw14FHAFXo1owIA/M7R0K6WVrop4NEpQZFubz+lQhjaxgRwblKRBm1xyDScEs6LYUqJCrmamJ9DnqoF3gYdRWDGpvHx7NiAtX/c7cmUaGLKeOQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(396003)(39830400003)(36756003)(956004)(478600001)(8936002)(6666004)(186003)(66946007)(4326008)(109986005)(1076003)(38350700002)(86362001)(6512007)(66556008)(2906002)(54906003)(38100700002)(83380400001)(66476007)(52116002)(6506007)(6486002)(2616005)(5660300002)(66574015)(316002)(8676002)(44832011)(26005)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e+Cd2AO+s87ls3mK22aCYNu+fn6nymf/NWcfj60duDw1fB+KbjyQINds7cXq?=
 =?us-ascii?Q?n5DqqErTR8bFr30H1h+TRNOm7m4h+Oq381CinQmCC037RPvKgjyE/yjxltSZ?=
 =?us-ascii?Q?NtYk+o2mXTxbI9ekrXFT6QHm6BeomSXVaAmP2Vmpo45d39E33ig/AuEoA8ur?=
 =?us-ascii?Q?Kk8m/aD+XXD0gz6iWG5WR4oggps0W6kHF/zF8lTLuwoC9f+QZI/xa0S1ltaH?=
 =?us-ascii?Q?SB2Aro48wkDoydKrF91GiFpw5TFJ4cLig8iSpRsj/wjF5rLJqak+bLPbrxO7?=
 =?us-ascii?Q?EDZDoQ4kjMzyOxcyR73+vb+MYANAN0T4Uw8rQwR8JZiWAaYlX1So6vypdYol?=
 =?us-ascii?Q?X+//LjYykb+VbrJ+WwERglQiwdOrUqRHp+w5fzDUxsVBNLBR1VVOVio04Z5C?=
 =?us-ascii?Q?1H+3t8kIezUt8W90L1+rj98v2Bq8dorQpfVfp2UWdp5EC9N/G1ebbaI8AB47?=
 =?us-ascii?Q?5hu9fGWKoxepkN+76If/DYGoHFnwAYZ/bFyHMZmRXiQHIyrLklYg6wkQFW6I?=
 =?us-ascii?Q?g+O+ETDBClbgx8MWAc+BDZYJxfAESKatNeurX6rYbuexbZW+tel+pICzmcJO?=
 =?us-ascii?Q?6Youpbi+zVAuHVecX9gPBlgqU03qiQEsNvhLc2nKEjsoL8RYp00zO82guQVY?=
 =?us-ascii?Q?C4JbA3ZH+4en5rRD4PkTVdJgcbFXhcFYQjCUW6SaNmk0sb2fRhTlXSYNuK8b?=
 =?us-ascii?Q?FkASZMN50qOAnI3uGiSywbC57sW6Ze31DE5D93ms1DVOvd/mAzWxhIhVceVy?=
 =?us-ascii?Q?72rDY9VRwT3pvCv5o1GwEj6M1YX05DMe8Sl5bmAg/sXZO8BQ7KykWclYWxro?=
 =?us-ascii?Q?uj1O3/Xa4wvcFOtaWnY5BDaWSDp/wkxTvgCZD0fxhQBOFogbOzc1VSlFxIoZ?=
 =?us-ascii?Q?IPnO80C3+WCAOlFRcUixu7BDi1F9pk1xN8HC5TZgOMrLD7Hdo8s9oWwiWtJ6?=
 =?us-ascii?Q?f706FFVchyxfYhxRAGUU89MA4+2S4ctXeelZ9iEsVoaJxjJALuuWD41m9X2+?=
 =?us-ascii?Q?WnKWg2R9Ci8cUjt7BD5fzGjUXqCe0Pkzq+df7v+cgGJyFsGF9HXX8zA4tMin?=
 =?us-ascii?Q?FD4Aa9mqiHbdLsZwHgaoNVHJlL1I7V15+A+0OZj3mcbIodegYja2UO0w4YDh?=
 =?us-ascii?Q?acmZMhbhgfgW6RpF7wpjgCJ2jKQpzLdzIdakqWPjBfTw2OIAmGPGMRdDq8jX?=
 =?us-ascii?Q?hmEh7FfoozJxlij9nQFWiLlrQRTbeAUTmu2CowDgGpW0OW9NzOnqP17+CYP7?=
 =?us-ascii?Q?zl4we9SFNjZZQbhuAnk9uNyY3O6ymI5qUHyWFSNQXWUXa2cpbJBvF8SSe9VT?=
 =?us-ascii?Q?t5Lu4vSb+zizmROOrfgehXhd?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883e1578-5e79-417e-1980-08d9504b0d23
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 15:35:52.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pl3cSa0OxQPwoEVrJGY10keWMz/r0q+qPaIzgKOEk5yzklvHI2bAFZCbaAay2nayqYwgmrkiRHQAuBJt+BVtqgOudJMl06gZeqOhkneKUQiNQxZ6/do+Av/38rZLjWLj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This reorders a few entry so that they are alphabetically sorted.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../bitbake-user-manual-ref-variables.rst     | 54 +++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst =
b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index 57a759f1..7b5bbc28 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -231,23 +231,23 @@ overview of their function and contents.
       based on the interval occur each time a respective interval is
       reached beyond the initial warning (i.e. 1 Gbytes and 100 Kbytes).
=20
-   :term:`BB_ENV_WHITELIST`
-      Specifies the internal whitelist of variables to allow through from
-      the external environment into BitBake's datastore. If the value of
-      this variable is not specified (which is the default), the following
-      list is used: :term:`BBPATH`, :term:`BB_PRESERVE_ENV`,
-      :term:`BB_ENV_WHITELIST`, and :term:`BB_ENV_EXTRAWHITE`.
+   :term:`BB_ENV_EXTRAWHITE`
+      Specifies an additional set of variables to allow through (whitelist=
)
+      from the external environment into BitBake's datastore. This list of
+      variables are on top of the internal list set in
+      :term:`BB_ENV_WHITELIST`.
=20
       .. note::
=20
          You must set this variable in the external environment in order
          for it to work.
=20
-   :term:`BB_ENV_EXTRAWHITE`
-      Specifies an additional set of variables to allow through (whitelist=
)
-      from the external environment into BitBake's datastore. This list of
-      variables are on top of the internal list set in
-      :term:`BB_ENV_WHITELIST`.
+   :term:`BB_ENV_WHITELIST`
+      Specifies the internal whitelist of variables to allow through from
+      the external environment into BitBake's datastore. If the value of
+      this variable is not specified (which is the default), the following
+      list is used: :term:`BBPATH`, :term:`BB_PRESERVE_ENV`,
+      :term:`BB_ENV_WHITELIST`, and :term:`BB_ENV_EXTRAWHITE`.
=20
       .. note::
=20
@@ -276,18 +276,6 @@ overview of their function and contents.
=20
          BB_GENERATE_MIRROR_TARBALLS =3D "1"
=20
-   :term:`BB_HASHCONFIG_WHITELIST`
-      Lists variables that are excluded from base configuration checksum,
-      which is used to determine if the cache can be reused.
-
-      One of the ways BitBake determines whether to re-parse the main
-      metadata is through checksums of the variables in the datastore of
-      the base configuration data. There are variables that you typically
-      want to exclude when checking whether or not to re-parse and thus
-      rebuild the cache. As an example, you would usually exclude ``TIME``
-      and ``DATE`` because these variables are always changing. If you did
-      not exclude them, BitBake would never reuse the cache.
-
    :term:`BB_HASHBASE_WHITELIST`
       Lists variables that are excluded from checksum and dependency data.
       Variables that are excluded can therefore change without affecting
@@ -309,6 +297,18 @@ overview of their function and contents.
       However, the more accurate the data returned, the more efficient the
       build will be.
=20
+   :term:`BB_HASHCONFIG_WHITELIST`
+      Lists variables that are excluded from base configuration checksum,
+      which is used to determine if the cache can be reused.
+
+      One of the ways BitBake determines whether to re-parse the main
+      metadata is through checksums of the variables in the datastore of
+      the base configuration data. There are variables that you typically
+      want to exclude when checking whether or not to re-parse and thus
+      rebuild the cache. As an example, you would usually exclude ``TIME``
+      and ``DATE`` because these variables are always changing. If you did
+      not exclude them, BitBake would never reuse the cache.
+
    :term:`BB_HASHSERVE`
       Specifies the Hash Equivalence server to use.
=20
@@ -357,15 +357,15 @@ overview of their function and contents.
       running builds when not connected to the Internet, and when operatin=
g
       in certain kinds of firewall environments.
=20
+   :term:`BB_NUMBER_PARSE_THREADS`
+      Sets the number of threads BitBake uses when parsing. By default, th=
e
+      number of threads is equal to the number of cores on the system.
+
    :term:`BB_NUMBER_THREADS`
       The maximum number of tasks BitBake should run in parallel at any on=
e
       time. If your host development system supports multiple cores, a goo=
d
       rule of thumb is to set this variable to twice the number of cores.
=20
-   :term:`BB_NUMBER_PARSE_THREADS`
-      Sets the number of threads BitBake uses when parsing. By default, th=
e
-      number of threads is equal to the number of cores on the system.
-
    :term:`BB_ORIGENV`
       Contains a copy of the original external environment in which BitBak=
e
       was run. The copy is taken before any whitelisted variable values ar=
e
--=20
2.31.1

