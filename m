Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6855C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 11:20:39 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.3])
 by mx.groups.io with SMTP id smtpd.web11.10063.1739272801393175970
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 03:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=l9invXsv;
 spf=pass (domain: cherry.de, ip: 52.101.65.3, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKfDZ8RD7wD+fbaSs/iuM54iTFfwAs5ebRkAijFR6t92Nz2kP3oLJ1F4IbuAHUINSkIXRxnpMfxU9hqXkjzEwq17j9arJqTrr1x/hloreErrHkM30sRQBra21souSpZ6YE8mr69/2eR3qX/z2PLwos8WmuJwb+UO7wWzWAOFXmsQdxtabBZlaCYHZcWOhCs9diN7yyqT3QFdVjec5IViV/m2jRezNIq1tJRTUBQijLij/JhQ8TfZ9OEFdsg31l76BJ6OH7QaTGwHnbSdRAB3ne/iAt0BDjbxDGNim2FcMonMYjvIsFwctrd4PgNnlcKU7lHDjharkkDuEeI09BMVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAVNyUnZ/ryAILOgzjIK+neBB3OYac3nVAyJ+dfOZ6c=;
 b=tT9XbXGXaIX+F5SVtiCYPawYD1RGpafHBTshY04XDCt1/mkJlS33A0z7XGK+JQylgslz5MzvRfJqncrbdYcmsQH6PZcJPT1zdiqUk6aFimUOuoRuPAp7QvLJIJqy2UjP/W3pKan79OanbzZPAj5j6F4ntshJctS1P+3UsNirMTPsqvhkU83wr7LlqUwD1XvUdk5opf1QL00oAKbP1A+153y1G0yEUKbe8Q8uftj7YMa8Xz+OsYQ8pIVFqYXFNJVbeqm90zI22Rybfths06puwn1AQ5Lok6kYLFViINrtLw7Qti1s3k3QrvYt1YT7Epj0XSuDMiL7sszpjbauZUqV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAVNyUnZ/ryAILOgzjIK+neBB3OYac3nVAyJ+dfOZ6c=;
 b=l9invXsvvdq4kydpVBszEZBTOWb3TQ3j+JF0shDcqHNdxDpoIZYLTB83JPY+xs5ANK3G6lKKcZVreuHhKYW+8Wv/9OW6dNvbYDgOjr3PSAVF6f0BN1t/nTvNa/fk0PHWTk8VF0mJlcPUSLcVJSuWy5hRySxkVsWn8gUDZn7YgRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7362.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 11:19:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 11:19:58 +0000
Message-ID: <592b4b1d-990c-454f-a5e5-04aaf780bc1a@cherry.de>
Date: Tue, 11 Feb 2025 12:19:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 5/6] dev-manual/multiconfig: improve the current
 doc
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Hatle <mark.hatle@kernel.crashing.org>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
 <20250207-multiconfig-doc-v1-5-f63cdab1fad9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250207-multiconfig-doc-v1-5-f63cdab1fad9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR07CA0132.eurprd07.prod.outlook.com
 (2603:10a6:802:16::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 1875f98c-5076-4df4-3c0d-08dd4a8e04d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NTNCZW8xOVc1VDlmZjRaTTgrcUtMczhwZHNsRmEzWEZHNlJKdEppSXNUNlBZ?=
 =?utf-8?B?d08zZGlMQzhpQ1k3Qnpzcm5PR0tYUk9tVWZWVzNMaFVnVVh0Z2lBVG9SSlF3?=
 =?utf-8?B?b0tPSnVBT3ZZOHFHTmc4aDRWdFdYc0EveWFYcm5idW9zbDZFZTRqWEQvT3Js?=
 =?utf-8?B?TitMOEpHeDFnajBGbXVldy9HeFIva0VURTI2RjZLc000aitOMi9nZmFlR1lV?=
 =?utf-8?B?d1VYU1F2OE02bkV3cEREekJOT3o3cWwvR1pTK1BwWWV5cUlldzBMdXk1ZXp0?=
 =?utf-8?B?dXR4Rzk0V2hTaFFCWnpySnV5K2RUblY3WjVGRTJIZ1pqRktscmVmUDBuKzd4?=
 =?utf-8?B?ZFdTMHRRR0pkNGcwWk4yclFrY2RHUDhmNEdjM21jTDNwaURCWGhkOXY4aXFB?=
 =?utf-8?B?Qmp4ZUpNU05DbTc1ZTRTQnhYbndlOFlRZElYK1loQzFZaVdoMjB5U0V5Qmpa?=
 =?utf-8?B?VmErbGpYdXlUMzhHUWVIOGthOVRCMnZqOG1SV2t2ai96QjFiV3RSRHUzMFhk?=
 =?utf-8?B?RDFsWVlLci9HYzF6RWVJTjZFU1AwamErWUhlckhObC81a1E5Yk15RWZzVmg2?=
 =?utf-8?B?WVZzZWtDT0lacEFNKzVDcEZYL3ZCQmx3UTRqWnhqU0x0bCtNeGhYa1pGVGZn?=
 =?utf-8?B?bndLK3dadjB3bHhDS1R6MldERENZSWVRNGx2NHFlRmtkZ1g2OHkzMkQvUWRa?=
 =?utf-8?B?Wi92MnNUaGsrbTFESFpHUFFFNGIwNUJvK3pnSlNhRE9hc2FrYmZZZkYzSVhl?=
 =?utf-8?B?TXMwZEx3RXJ2ZkMxZW50NzFFQnM1aEp2bGVpb1YxV3ZBU3pRZWY3cVFGNnpN?=
 =?utf-8?B?cUZoaVgzTE05b01BeEFqOXVtS1laMlNLT3ZsWTlhUFlpL015Tk4zNmR4Z1ZL?=
 =?utf-8?B?R200VWRrTEZCeTlXUTRRd09YUmIwRmJjR0k1bURMVFpjZ0FWOHVYbHFKZGR1?=
 =?utf-8?B?c29zVDNTMEZmL0dsenlMYzdaVi9ycVZOSkVYbzZaaVRteHRQaDB1ZjNaU0cv?=
 =?utf-8?B?WkQrMk1IWGlkUFd0TlNFSUxxYUcwQjNIbnQ4V1gwY0JIRURaemt6SmNYSHpq?=
 =?utf-8?B?blRUcEQvM0x6dDcvTW5XRm5oZFVBbk8yOUtKbDN2YW9LNFdSelhtLzJoTDkr?=
 =?utf-8?B?OFpkVmttUHZJLzhoeHVFQUF3V1hlNURHV1JtU1VXNWtYYUl6Q1lnRGhzSVJ3?=
 =?utf-8?B?MXF2KzNiais5SXR0ZjR5WHpBVlgyTVlpTHlzV3JPRnE5UnZYMy95SHQwMWJw?=
 =?utf-8?B?TVpocGpoSkV4OVg2dkp6azdtM245RHdNN1duZnQvc1ArZlF1T000TC92NTVP?=
 =?utf-8?B?bDU3cjkwcEhIN1JXMjkzNHFraVg4clpnVjlFRnJrZlRIMktSNGhrWEJZaHA3?=
 =?utf-8?B?Ny96MjdiUS95aWNtU3lWekg5Q0x1RFMrdG9KbnhIUHAzRG1rajFvTVZGd0ww?=
 =?utf-8?B?dm5FbFprOFBtSUptOVgzc1hXQml1ZGR4L0I3VkthanVDZ25aVXU5VHlrVEpS?=
 =?utf-8?B?VGRQM2I0bUZZbXI1MmVMMDZmWlhWNlpjU0FNb1p5emRNa09WVzEyc2FqMVhD?=
 =?utf-8?B?MEQxSE9yTXVvK0pnWWg5TEVUUHNONGU5ZGcwR25rdVZuNExIV095SExtMWg0?=
 =?utf-8?B?Uy9ZNVZWK3BFWEt1WTEreVhodmRGMDMwMkJnZmY1T3YxTWdodXFQTmNjSXkw?=
 =?utf-8?B?ZEloZFRzZFRvT0lEekJiRk1OVDFtUk5pVjFpK2MrWEV4dEFaeEdVR3hrV1A1?=
 =?utf-8?B?QjJOdDk5SU8vd1psRVh3WUtIRmtBaUQ4QmxhRUl6ZGU0ZjgrN2dkeVhReCs4?=
 =?utf-8?B?R1ZjU0djYnZMc2lRdEx4Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXIvcFJnbjVjY252aGk4dmN2SDBqN3Q2QTJ5WUN6Tmo4RXMwbTdNSG1sUFhT?=
 =?utf-8?B?OHVZUEdReVdhVnBNdFcxaU12OGNZRGNEYnh2Z2g1UHRCRlBCcUtHMWpSa3F0?=
 =?utf-8?B?Y0c0NE5mbjlPcDFZUGlNSk1ocjZRNWc0WnlORUNXOXdEZDRoemV4M2NkeVQr?=
 =?utf-8?B?eEd1RnUwUVY1S0xROVBEU0Q0MkhvWlRieXNzdXNtS2ErZktaTDUxT2ZMTCtr?=
 =?utf-8?B?WVR5aG93S1JhQkhCSlYrT0o5eGIwL0JQQWExMkhBdlFRVmxkR1pPdGhLVzBX?=
 =?utf-8?B?d2NsZ3hIYTA4M282L0FPLzFrMldhSkxFSWdCczk3R0tqK3haZ1VVNzZtUlVH?=
 =?utf-8?B?bFN1bndiYk93SkR3SDdPaDNiaDdrWUR4YWtXN3BDVkVlL3JWVXVVS0VRcGR4?=
 =?utf-8?B?dnpkdS9ubGU1d2lrdjJSMlU5RVVCU0ttVWYrR2VwNnhqMTdoNUdSLzdRZzE4?=
 =?utf-8?B?Z0VuaE5FQUlHc21uUC9QMmhmNmVsRmlXandxZnNQaXBJbVM5VjJNVjh2RlpU?=
 =?utf-8?B?WlpKaXRhK1ozYllXL2dwUUJLYnJSbkZPbnpXckRtdW45MVN2dXcrckcyT3ZG?=
 =?utf-8?B?VVlhU05ranAvTVlBSElBbFJkQWZzalBPbEJvbktTUklDeUw0YytFVzFKcUtV?=
 =?utf-8?B?V1RnaXVUY0pMZjk3eG9vSGlibHUzQSt6UWR5TGZuZ2xaYW9xYXM3b0tEQWRB?=
 =?utf-8?B?b2svcjdKOVhhOWNzVllubFg2cDI3MFRuUTVaemN3UG1xd0g4WjNDSklKOW5m?=
 =?utf-8?B?ZDZuaDZSMEtCc1NpbWgxd1FwTjFWd0l4VkVCeERSZWMzTndla0JHeHJNOWFW?=
 =?utf-8?B?UTkvMllUL2xSVVNZRGxYNllDZGd2WUNPOG5lOTh6QzliT3FoNXJ6MkpGWUhv?=
 =?utf-8?B?UmY4VEVMV0lnb1JYUzJmbCt1aVdXVjZvUmhCN29ZLzEwQU5MajJDS0xId0Y4?=
 =?utf-8?B?SnluVjI0cG9RbXlXekNYMWZVWTRUSVYrenJzdlBBb091RTJsSW8rMWJHdnRF?=
 =?utf-8?B?S25iUkMxUlZDb2VXa3hKOC9SaGRqdUxQMWxIRUF2N2tlSnhTRDk1am5EcUZp?=
 =?utf-8?B?aFlBVEZTLzl1UXlNR1RsS1lNVktKVDFFK0lJRkN6azRQSXNrbWtneE04L0pQ?=
 =?utf-8?B?ZnF5bG9xUzl6Y2d5SFNzSlNtWHJyOWNGZjhnZDVRandHZG5nOEdtaW1EQllw?=
 =?utf-8?B?S0ExTllYc2JyREdEYVo4dktxdE9BRllpZkFpT3prT2tqOVZwRDN6WmlHZU10?=
 =?utf-8?B?ZGg2dFdacnBXYThxY3NDNjZkTVhmVy90Tk5aNTE2ZkhBVHdnZlp0ZU5Jdm8x?=
 =?utf-8?B?T3MvTitWN3A5TllKK0tIakJOdWxpVGhjYmRWZm9SRWZ0QTFKaTZQUGpYaVM0?=
 =?utf-8?B?aDAxRGkzR0QrNGJPazNYZ0pXZzA5cFU2ejNHRDBMTHUrVlJmekxJcUN3Tmpu?=
 =?utf-8?B?R042bnNVL1hXd0RPSm1jOS81WUJCOGZBMjE0RjFqeEZWT2lkODh1QlQwZ2xG?=
 =?utf-8?B?UTRQUTBERklCSWpZbWdsK0lFVHg1QVZYU21iMmtQNE9XeHAzY2p3Nlc1dWdN?=
 =?utf-8?B?aldEUzRCczF0Rmdwb29ldmlVcEpyQ2Z2QWxNU2wzOFF3NzZaRUJ3UFFQbHd3?=
 =?utf-8?B?WStNaGtIRXdXMnNWTGY0NzRnVi8wQjV1NmFRSTBUbWRwQU9yMHc3czdCcEcx?=
 =?utf-8?B?TytVYXIxbDltS2orYU9MSWQzWGFETjNSN1lXQVNoY0U1dE03cXpkcEZkZFJ2?=
 =?utf-8?B?UUY2aW1uY1BJL0lFd2VXekJORDUyKzFlQnZoOHNLSkJmZEh3U0hCMzkvTHNj?=
 =?utf-8?B?bjlNc21ORWNTK2JSSksrNnlEMjVWZjFZdzdqcmQ3R0NKZmhxY1N1dWhUcHBI?=
 =?utf-8?B?bXppQW9vS0VPUGpwR0h5bnREVnNqVFFsL2xreDEvK2crckRZRXJnSk5tM0U4?=
 =?utf-8?B?T1dMZTQzK0JUeG45c29QQ3FNekxGWXBNdWNwenBmd1FhYTg2andjMmt5Z0ZY?=
 =?utf-8?B?ejJIT254Ry9rWWw3S29ST0dXRVdGSnliU2R1eE9hdXhnVDFraXZkNDRrNWcr?=
 =?utf-8?B?b1MwUk1qeFNxYWR2RHlnbDVzUlV3MFJUVDlsWUtZRDlBUjlDL2RLVFIwdGoy?=
 =?utf-8?B?NWxRUmFIVVhQNEY3bWFLUnRzT2FrN2RwTEF0aTNmSkQ5Tnc2OTZjOWV6MHNQ?=
 =?utf-8?Q?smZ49bm2/6mHqlqgQoQNeLA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1875f98c-5076-4df4-3c0d-08dd4a8e04d2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 11:19:58.4504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWZC4GOoqlk/SiCgpas8hcDpb2yur6HrPbss1M9uz8I5msRGXxqaHLp5NB5AczM9qMeVhaqffXK/rqjDGR3hPPFSOubWuCi9vFHkWevJSmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7362
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 11:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6332

Hi Antonin,

On 2/7/25 5:28 PM, Antonin Godard via lists.yoctoproject.org wrote:
> After the suggestions from Mark Hatle on the list
> (https://lists.yoctoproject.org/g/docs/topic/110487932), rewrite the
> introduction to multiconfig with the following changes:
> 
> - Move the part of overriding TMPDIR or not to a note.
> - Use BB_CURRENT_MC in the example.
> - Various additions of references & improved formatting.
> 
> Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/multiconfig.rst | 65 +++++++++++++++++++-------------
>   1 file changed, 39 insertions(+), 26 deletions(-)
> 
> diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
> index d8f6470d5..27442a042 100644
> --- a/documentation/dev-manual/multiconfig.rst
> +++ b/documentation/dev-manual/multiconfig.rst
> @@ -17,7 +17,7 @@ Setting Up and Running a Multiple Configuration Build
>   =====================================================
>   
>   To accomplish a multiple configuration build, you must define each
> -target's configuration separately using a parallel configuration file in
> +target's configuration separately using a parallel :term:`configuration file` in
>   the :term:`Build Directory` or configuration directory within a layer, and you
>   must follow a required file hierarchy. Additionally, you must enable the
>   multiple configuration builds in your ``local.conf`` file.
> @@ -25,31 +25,27 @@ multiple configuration builds in your ``local.conf`` file.
>   Follow these steps to set up and execute multiple configuration builds:
>   
>   -  *Create Separate Configuration Files*: You need to create a single
> -   configuration file for each build target (each multiconfig).
> +   :term:`Configuration File` for each build target (each multiconfig).
>      The configuration definitions are implementation dependent but often
> -   each configuration file will define the machine and the
> -   temporary directory BitBake uses for the build. Whether the same
> -   temporary directory (:term:`TMPDIR`) can be shared will depend on what is
> -   similar and what is different between the configurations. Multiple MACHINE
> -   targets can share the same (:term:`TMPDIR`) as long as the rest of the
> -   configuration is the same, multiple :term:`DISTRO` settings would need separate
> -   (:term:`TMPDIR`) directories.
> -
> -   For example, consider a scenario with two different multiconfigs for the same
> -   :term:`MACHINE`: "qemux86" built
> -   for two distributions such as "poky" and "poky-lsb". In this case,
> -   you would need to use the different :term:`TMPDIR`.
> +   each configuration file will define the :term:`MACHINE` and the
> +   temporary directory BitBake uses for the build.

Add that temporary directory = :term:`TMPDIR` maybe?

>   
> -   Here is an example showing the minimal statements needed in a
> -   configuration file for a "qemux86" target whose temporary build
> -   directory is ``tmpmultix86``::
> +   .. note::
>   
> -      MACHINE = "qemux86"
> -      TMPDIR = "${TOPDIR}/tmpmultix86"
> +      Whether the same temporary directory (:term:`TMPDIR`) can be shared will
> +      depend on what is similar and what is different between the
> +      configurations. Multiple :term:`MACHINE` targets can share the same
> +      :term:`TMPDIR` as long as the rest of the configuration is the same,
> +      multiple :term:`DISTRO` settings would need separate :term:`TMPDIR`
> +      directories.
> +

I have zero experience with multiconfig, but I think the only case where 
we should be able to share a TMPDIR is whenever all recipes but the ones 
whose PACKAGE_ARCH is MACHINE_ARCH are the same for both machines (or do 
not conflict, e.g. a different TUNE_PKGARCH for each machine). This 
includes not overriding anything for a machine (e.g. 
do_install:my-machine-a() or SRC_URI:append:my-machine-b, etc..; though 
I believe this must require adding PACKAGE_ARCH = MACHINE_ARCH for those 
recipes?). Overall, I guess this is a VERY niche corner case?

Cheers,
Quentin

> +      For example, consider a scenario with two different multiconfigs for the same
> +      :term:`MACHINE`: "qemux86" built for two distributions such as "poky" and
> +      "poky-lsb". In this case, you would need to use two different :term:`TMPDIR`.
>   
>      The location for these multiconfig configuration files is specific.
>      They must reside in the current :term:`Build Directory` in a sub-directory of
> -   ``conf`` named ``multiconfig`` or within a layer's ``conf`` directory
> +   ``conf`` named ``multiconfig`` or within a :term:`Layer`'s ``conf`` directory
>      under a directory named ``multiconfig``. Here is an example that defines
>      two configuration files for the "x86" and "arm" multiconfigs:
>   
> @@ -58,7 +54,19 @@ Follow these steps to set up and execute multiple configuration builds:
>         :width: 50%
>   
>      The usual :term:`BBPATH` search path is used to locate multiconfig files in
> -   a similar way to other conf files.
> +   a similar way to other configuration files.
> +

Using

:term:`configuration files<configuration file>`

here maybe?

The changes look fine to me, just an issue around using BB_CURRENT_MC 
when it's not actually usable yet (not merged in BitBake just yet).

Cheers,
Quentin

