Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A53DCD4F35
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:36:33 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71107.1778574987918695594
 for <docs@lists.yoctoproject.org>;
 Tue, 12 May 2026 01:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=DDzj4lBO;
 spf=pass (domain: cherry.de, ip: 52.101.69.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjxgyM+D0JfEG710KkYvNhPqWIYTe/xU9EVdMNlwrSbaD7aGJHnTg6Q7ROGj1oe/ZHtaENqDviL0fG9QSVEpNQGXJXBDOaDHkacAVq/lfqAHe/PTME7QPommDd/668wLhmR+G3RL9RJrZh89vzv3OsbSNk/W3kw/VEixWC3+EBXqxZkwzFj7ywW5PGHubcUbuyEHNTLWrBUFo6E43CNgsYDuXOtikfNnbV7Kyry5/fk4uGcRKL2oLNzb+GieCUld2wjZJOLKfyK5WQD8D9c32HpP6niII89/5GBRKxboUrlljimdcLDWpfAwHOX5c+6LlaKXmLg37QkD4pnsZwLaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojqD1prPZI1g2Z7VusGXJ4B3bpzQqkoz9rXhLs2/okg=;
 b=B5Keqf0POsDMvZ59wdD8u95FuWEaFQPaA8HQGwi1/PYTpHAbbM1ztUyVTL4BzUiBAXy78d7k9vUZXlYSDozRU9oi6tB4cptHKByW/CZS8+n9D4Y9CSdCNG9JLlXx31FXsCFrmx6XqSi4jrhdL0RjpaxUmirKpEgOAdfbgU6mZSaExyOywkbD220LGu1AZyCDql+aIMvZVy4sigxRj/ODs6/9v/XHUgsoh7lx0gmV85j70P2daOmYiVLpIsaOLlqzUTK6+SQotm5tFMCfpP36a/ZakFA3hZxa9ggcX/s1T4TVzxIHs4h/1WJvx+OmdMZ7i9awczkM7tXbDnldBRgQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojqD1prPZI1g2Z7VusGXJ4B3bpzQqkoz9rXhLs2/okg=;
 b=DDzj4lBO0x1rc8yTgJWCQeCfc3NHb6Cb1ezVbNvOvylYQ/QvjxXYZWGw4zv9u8hS6LJ4HdwbhXMTPzmcR7LrX+0GruNkjxio6glZ9Gdbaz2BgBSjSMtObTHFbYcrz4wQ9Xt0H+Q36hgti8dcUNuYLnu5fHRDhowiC4S/LPka8jI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB9661.eurprd04.prod.outlook.com (2603:10a6:102:273::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Tue, 12 May
 2026 08:36:24 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 08:36:24 +0000
Message-ID: <0dfd7a48-266b-48b8-b3ff-87b26ce60e45@cherry.de>
Date: Tue, 12 May 2026 10:36:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables: document the 'dynamic layer'
 concept
To: mw.choi@telica.co.kr, docs@lists.yoctoproject.org
References: <20260511093446.2350-1-mw.choi@telica.co.kr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260511093446.2350-1-mw.choi@telica.co.kr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c4008e0-7738-4332-fcee-08deb0018cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|56012099003|22082099003|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	al0H4X6rXl0dH0LXlgQXvYJ3Bknzalyo9uLgnzJJDDJn645CoF4DcsMVGWZnY4mR3nIoHEZI08x0RJwL3YOi5akZ57eMQ+PkwkEvnWFNE9xs41Ay/b8xK7ln/r4BCbfSuVnB8MZ0d8DIZod1tLyo2VELUoCdTP0rwDxMqvciaub9l0IYFOZwr2OkCjZ1+0klHd5AkRBxCem+FniieJLHeAkYMG2bvt+BKUQcGlnOsX7zzJpMi7JkpcT4LmTMdMifIXJ2zsiwBrxSxgHfED1xrDlzPw82swi80/J7yQKbqfvTpDJ7+KfzR5Uwxq3dU7EX2xoJ8g3U2Bie9BvQqz64jgCfapT1g76ki14iGzwuSKPyyBPkPplnvLjt6KBVEw29o6yNXLqQdQ6VxJZnLHvZhpvFNAI+hTykk5Bi/Xkj5aDICZq5IbCCNtEKFIH7Ygckm4yy4wu8iGg3/9tq0niJMajy/G/2zuVAGdRtlE/PUZwPFCduYeFtqJrwhp9kDg5W8UGT3ho6bmSie1pZVPZoLBuP9Xkf9oxsSKzQzBaYgdOxyD9ap1k3dV0mfyvVkrFz3SCunwE06eAx/dzwHJkutl4fwf9UInCBywy2X732oPH18qKRsUn8XngK0ROBVJsmIGkcFipgvPFdcxTTshoV4Ivxmi0Ru/Ff2ez96lP9Y4Yqn2sYKkig11tA052mP4yI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(56012099003)(22082099003)(11063799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NZX874XclMErvvYuMVlBmOmuT2QP2K27daDBV96lg2ByZw2i50nbdhoKJnKF?=
 =?us-ascii?Q?lM/EQk9kHAsSuBF8+YCsNKfaX3698soLRPyT3PNdMCBBLMBfmftWI7xFTBM3?=
 =?us-ascii?Q?iFVbgs/nOKG9qTocj2yW9R0JAGcvocTT3mRm3Vf6gQgmUYaCiR3EZmn1H3qw?=
 =?us-ascii?Q?WpwYB7vr1DqH86Kd07mwiW8ZR4Cx7OtiwYKL1U5FBh9ls35aQyCG4iz3S6P4?=
 =?us-ascii?Q?RHicKQVsCqutY8qveCwFzG6qOrgHah7qfZ7ivln795dBBkeWw2f1VhqgPMbm?=
 =?us-ascii?Q?nML0EJD6hLp6RhP4sRmN9fnRfhKgbDqMU7YhXcFSQfsjuxUfG79DUGtydLPx?=
 =?us-ascii?Q?YseINmtJqXsI0lbkrOTuXh7zE8ki2NSsTsV5Irb0XEnrjSh+Pg8Qe0fafiUm?=
 =?us-ascii?Q?kMN4nbnrkqh/RWBmh7G3vDEZ+5Z+82ecLU8Nn1WaIjmOd8cmV75lToCQrX9B?=
 =?us-ascii?Q?fw+VIAZBDSBOHJioAw7uufcAswJqnIm89yvlqjL3pyUbC329aw50DLwn4vxv?=
 =?us-ascii?Q?jU03BJRf6n/on2cNFOlE3GOpBPXEX2+n6jsau8PF1DPSt+9YP5Uj4488Gz3/?=
 =?us-ascii?Q?sP1S+3gBKFSzxMsKgbk/QspydW9CdNKLGt1jwkUEmFhemCZ5kHArSCstmUYn?=
 =?us-ascii?Q?9BqN/gKYIXjvR+q1+XJeHMDQh9qN4KkV/JX1OxfOBeSgLJ5d5uAqd31/MxKu?=
 =?us-ascii?Q?NOjiq0rkHKtq5Bg9WdWE88GKe+MPcuUzapduzmLdFBReP+Ad/tm/CvU4qPa7?=
 =?us-ascii?Q?7xl0za75oaQaQkL6tHda8f8YJi6sm1uHc6pjzink/jSoaeWkwdpUIJq1CZPs?=
 =?us-ascii?Q?dEKx1FfKoNQqr1zqj/1mkDhELjs0eXIvhuUSvR7Mc30fZ9YaLk7b8vMxzNbZ?=
 =?us-ascii?Q?hgSbZ/Fod7pAdAMVxsLDjhTwoTqh4lyEJQWBUgyWGDxXHPGT1vQ4RZIR1RJL?=
 =?us-ascii?Q?emN1PDna4Lr/WF5/l/xZED/tVCAGGfpMuWt1OINr541XC/b7m/6hIptLimIO?=
 =?us-ascii?Q?WMFDBQT8U1ubqHJ4KNcyXZv0TmXMupwbpKMOHub21ZtOf1XLik1SJkOF3xZM?=
 =?us-ascii?Q?MUJUQCeukunS1w7yB1Ga+XOASQ16+L3qc6/ijucHf3ma76FnrSqMMYWobY/w?=
 =?us-ascii?Q?eduXmrReuJJ/p3TegaVSCQtM0z70kRG592/3XnSzbxYNHEM+BnoM623JPl0q?=
 =?us-ascii?Q?1lxNwtWPf97d/hAkUD3usM4EPRXKp0NykVf0Ah/KqoF56iiWc9qArGdyTwre?=
 =?us-ascii?Q?t4XKw4HqPbjtM50oAl9oe5c5UjAnMz/EQ85FUqMILQGiMXKSCwT1Kq8kp3O3?=
 =?us-ascii?Q?ntslQWJjDwpG8hNQuDd2F5Z1+n0OR+N7Dx2kZ3SO4miFljed25rwxsYwkOCC?=
 =?us-ascii?Q?6v3yg3uTpx8FdanelD43SGTFBSB7DfetpRU3lVRceRf/REvDewOSjkxpz0kY?=
 =?us-ascii?Q?sV8JSLqBtYFMlZqAazKKRFJFyxD2G93wQIqSP9JzSvS1kJZV7wAGJ6W3gzlF?=
 =?us-ascii?Q?qz3Pd6JDrT5USoRKpb8fNjPVONaq7xxFgGD85SWRUuUSZuFpTAFqYPaqyS1U?=
 =?us-ascii?Q?3daUQwK98/CaPceCJrO/DMrVInhLQh95EIwmpxZjCtcMkTzK7LU/fkS/AEVS?=
 =?us-ascii?Q?GTEsIhx1t8fMjy62h6VlaRBSrr0zVyXiEmgvd+1prDu631A78F8UImJJ53XV?=
 =?us-ascii?Q?sC6JX1K36oZDfrpI4tHLPCnO+C3tScu8uc4M069KLbzHcobxAGiNIpK6oI+y?=
 =?us-ascii?Q?tB9GmktJzttSLEZYZlavc0lOEO3XcAjNwK9SkBk4eJ8gzZb5xpkIN+3h9ta7?=
X-MS-Exchange-AntiSpam-MessageData-1: 4KVT3RwEGYwNxVqZsRv5hxS5vJeIUwHoNXY=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4008e0-7738-4332-fcee-08deb0018cdf
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:36:23.9989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdivp0h89E9w3VsyN9IGRpQyLIUe0IWLIbjzol5IeHe+4O7JRNEHb0Vl6JMz375yI8uwdlyX7z5r8K5/6DLdQTMGubg6hJig/HH7jW699oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9661
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 May 2026 08:36:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9456

Hi Minwoo Choi,

On 5/11/26 11:34 AM, =EC=B5=9C=EB=AF=BC=EC=9A=B0 via lists.yoctoproject.org=
 wrote:
> [You don't often get email from mw.choi=3Dtelica.co.kr@lists.yoctoproject=
.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentif=
ication ]
> > Signed-off-by: Minwoo Choi <mw.choi@telica.co.kr>
> ---
>   documentation/ref-manual/variables.rst | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index a8cbb87cf..755929947 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -841,8 +841,9 @@ system and gives an overview of their function and co=
ntents.
>         previous link.
>=20
>      :term:`BBFILES_DYNAMIC`
> -      Activates content when identified layers are present. You identify
> -      the layers by the collections that the layers define.
> +      Activates content when identified layers are present. This mechani=
sm
> +      is commonly referred to as "dynamic layers". You identify the laye=
rs

Where do you see it is "commonly referred to as dynamic layers"? I=20
cannot find it in the docs.

Cheers,
Quentin

