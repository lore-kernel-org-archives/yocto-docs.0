Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00C0C98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 11:06:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4497.1790161562616085390
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 04:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hbpVQ2Fk;
 spf=pass (domain: cherry.de, ip: 52.101.66.6, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyWUGC4btUNEefaoJhc5g6wS+gPNtGqQ6ykLKM4IWR+/89lpP7tvDa3Emi0r46spfw2HJ40c6DFEBl1TX3HOUFDUVO1JMoLho4wTXG1xsHY2Vxf5Z5tiebpOtOwiCbtaTH7T2737Go3olkJtg87+oFNgbUVXD4Ip/7KNqbZyWYaMJv6tIWqx0Y2HdUdP5ro0IW3ofTm3QyrQlveRW834ZfK702jWpgUAUJR7pF1KvKw/zymaYKB4Fubbfy3rfjrShSOBxErS1FcYZP7gEQ/RX9058nn65NYgWb07I3e+2xC0jnKRM5of+ilNGlGKR4Xfm7MZjnW9Y7Tcv/Huyjm3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEwd3aUx7rLx1y7lVDR3MJ91WOwaf5pdq9SG9v7jQMQ=;
 b=CIHf6T5yd080lPyq+6bRtDK+IDxctUIlJOWEkGe9naH9t89gxXvSdU93UGdCb746bzXmmEjdoL+wHq7y2xS2T9OvGx048C1SjACYqi19nVZjCVUWIvc2kRadxSju78f2Nmj/6BhDGSS6UDSMvMdO7tbjyPgHW6ZSGABPTLfZxn6dfhs5Tik3+d8YedVeFz+49qOb+e1JcVRr8eczwqftR4+/NmK3EQTVHeQyaVRppFKEy75iUCekKvrh9/85898PlE+8ZK8iJNbqibWtYRr2TuKq/iBahKKFlW5pA0w0an2HKfemX0Ft8Qi9U3Y6llpAu0YEnK06Bzu1F+hEXmM69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEwd3aUx7rLx1y7lVDR3MJ91WOwaf5pdq9SG9v7jQMQ=;
 b=hbpVQ2FkDEnqw35HOJ9vkBOEwAyLxZIgJjHLnCtY/+Fd/RRY4agf5Xfz7zoXqQD/eVhuooy3rbw18VkYRyHTr/OsxBP7p5JKsyiwKVT5hPmSV6YTU3PIYB8KBBeW1gDQ21dhSY3aZSfNwekvopBpI4ii9t6Uhx+87Nz4MPRI5aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS8PR04MB9126.eurprd04.prod.outlook.com (2603:10a6:20b:449::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 11:05:57 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 11:05:57 +0000
Message-ID: <a0058775-0aa5-4424-98ce-5b80a60d37c5@cherry.de>
Date: Wed, 23 Sep 2026 13:05:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 7/8] kernel-dev: give each example block one
 thing to hold
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-8-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260922183249.2433345-8-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0026.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::39) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS8PR04MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ac4848-d9fd-4253-afd2-08df1962a4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|11063799006|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	sQjXAXzF96GQNhG4y5U4yz1bHMkTGPZI2zdWYLdSKZMyRctErVZPSVDNIL1aiezXUO9FHcqpgekX/9wevR57vmWN7WH380kLhW3SXPMuEM92Jakz1fCbshkFbknhLPlWJcN0zA1AdSPAZ6mbH07ymzz4Ca4wokgMpH8vElGzuYQOHycy5KrOpDgrKDVtEdKQexIohliMbtO428F02JPlfkJO39J4kJppBb/Y7riCsDGSuZgIhz/Ntuk2+NFuITL8aZgW+BCJ/ReqUb0z2N6XjKF2A/olamnKZ8vQeeomeq2Z1Na++kbxndDmJuAvZOR0YsTBEwM1F1albYGsflABpnCMN8T2LodrBaaDLOOReTSJRx2ti+GVlwa+U8ebX10+KD2XHRV41E096dg9SclX5GCat4yx4GJ4vN5YMSe3rAhGLpURn8Kgi04XqsZT+wah4m5YBy5fRR4Yacqofsi9uIL+x1yU64B4KHux4CRm0WPVZ6pi1EL4Dc/FqQ9YLiZMKxdOGar1lfIJw6yGAXk8cY1MpbyCYOZ8XiACSc7K9xntKIobyDN3ihEFczmeBc7ZZLsSVeLySo7HaAu0Oeyc9f7or4ECYH/yjAYkbTEgcfuw+V6qFJsSXcMltoWavcE0Yh+2ugzsMSuTatPPvnlaFwTRveQoR/4Gp1+QuBCck6M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGJ0amhEOTVUdHdqYzFUZHlFVFU3QXUyNTVLWXFYRFl6Z2V2RUczL3dGQnVa?=
 =?utf-8?B?Q0M4d0srOGRIWnlCVFVSYVU4b2g2cVYxTGlmMXZ5TlVWL1ptS0dSTkFIZDFs?=
 =?utf-8?B?c3Z4WG5YRktjWW84OHdtMUFLRTdmSElKUWgyUDg2WGF3ZHdIUVFyUGlUV0hY?=
 =?utf-8?B?ekV4YWF3UFVMVUxVdExOdjhCN2k2b0tRdXFDc3dDT2JUcUwxTlR5ZmFFWTFQ?=
 =?utf-8?B?TFlRYlljWU1CbTA0dmJHMTcvbGZTL2hpMzdqdXBpNC8wNDdhRVRqV3B2aTdI?=
 =?utf-8?B?TUV4NWFYQmJlZkpzT1M5OHFmY3lnVHQxeEdwOSs2NlorNkJXY1ZLZm95ZWJy?=
 =?utf-8?B?Q3YrOW5QY295NWdFYUlzNWZPajl4U1o2NUxRQzlPdGsvM2FyVmhnMFV2VkJm?=
 =?utf-8?B?UENCTW4yaUNHSDRrNUdKT1FvRitJR2VUVEI2VFhVSWc3NUxtVnFNVHdlbFhZ?=
 =?utf-8?B?YXB6eUhLS0NBbVVlVjI1Z1FBY3NyYVZoV0lKYXZQcERsb3RmUFhiQVhhTVBv?=
 =?utf-8?B?dTZ1MDJGOUFYYVI5c2tMZFQycnlVbk5PemhHbmcrbWdndEZ3cTlXckVJbHMw?=
 =?utf-8?B?eW53andnNmxFY0ZuT0tNeVdaOXBJY3VHcmVsSzlPbjA5T0Y5STBRZjdKUjNl?=
 =?utf-8?B?QWdBR3BjR2JyMkRuWENqSGlUYURPM1FuN0xtcnJkbEdQSC92NEZLejQ0ZllR?=
 =?utf-8?B?QTgweFhmdEhMd1dpZk15a0RNQmFHZTZoS1h2UFVUc1NPSDJnWGd1b3lyWHB4?=
 =?utf-8?B?VlJTQ2o0UWdjQ3Nsa1orTW9DYWpHVHREZjdxbG5aaFJEdGlXUXcvUVl0UTZS?=
 =?utf-8?B?OFBwN1psYjR4c2IzOEl4emlCSHAwYXhnaGZ3VXlBN2hsaHQyMCtkMXM5Zi9z?=
 =?utf-8?B?SFliT0d1UlVsSkV4R2c4dld1ZzhIeWNBL2xrZVhMMEJpbXVHYjRLcUUzdXBY?=
 =?utf-8?B?S3hCUnlWQ3BCRUdGK2VSMk1nQVlsdkRrUUdvOG5YR1REQnFsanN5UEg3RkJD?=
 =?utf-8?B?RWhpSmlCM3UxNURFVzdpbXlDWE53cnFxUHFlL3ZZdjZURDUweWQwU2gxaHFC?=
 =?utf-8?B?MUs1cFExc3BZMlZmREV5U2lLQ29JWFo2STVpbWYwOFdGZSt0MmtPNnQrUnBL?=
 =?utf-8?B?eXE5VDNKNVZHRDRKWWF2S21TMTE1ZkNONHlsTkZCdHlYdUIyZFhoaXV2WklH?=
 =?utf-8?B?Nk15M0QvQmZCc1VxR3JkQ1J0M0xaMmVxS2ZNck9FQ1pUQWpzcUErbkx3S3JM?=
 =?utf-8?B?VlpSZ093S2dLR0t0dGZwczhmQ3drbGI3VzdSd1grSXpnNGhuaURqQ3VybXBq?=
 =?utf-8?B?Y1hNZXR1TEloeDhnWTVYMk9LUlp1WTB5VTlMdHlTV2hCUGtLa21PNUtSVlNu?=
 =?utf-8?B?VDQ5NnhzM2gwZS9kNUE2WEVGQWJabzh5V2J0NnVIbzFobHp6Q29pTUJJZkJ0?=
 =?utf-8?B?dlczUm9DZ2lkL3N3MlZYb1B6MEhqb2M0ZFNaSDJyaWhNaVdJUklFN2R0UGFE?=
 =?utf-8?B?N281L3d0ZE5CNUEzM3NaVkcyODFtbGNSSEk5bzI3VkJzM1dhakFvaDBrWEtB?=
 =?utf-8?B?TDV0N3RBTXM3bnVWaFJMUlpPcklTUkdPWGkxVGI0VXBFaFlqVXBZUU9ETllz?=
 =?utf-8?B?U3Z1ekNDNHdyNTFXSEVmcjVZb05rRkZSMmJZNzZjclRWSlAzMTYrd2d1amRn?=
 =?utf-8?B?S2N0czUvc1EvY1pqRVJNTnZldXRLckw3SEJ1ZkdRaDNqYWNWTTE4UEhlQkQ2?=
 =?utf-8?B?YVg4clltdHFHTzY5ZW9jdmE5Y3hrWk1VY2FiZmswTE1FcGEvMS9ndWMyVkhK?=
 =?utf-8?B?OUZxL1loWVZHTktxTC9sQ2Jib2dCdzViMDZrYUNnN2VtVmcyczQxS3JZSEQ2?=
 =?utf-8?B?RGMyam96R3N3ZCtyZkJNRFY5VklEYjFHU0JUL2NFMVdEMjBQV2hieHArbVha?=
 =?utf-8?B?TSthc2JFRngrUHh6OVFBY0RCaStBNlo4elNTQlBnRnEwRSsrbGZVZFI1MzJj?=
 =?utf-8?B?eC9henN1NjF0d1hwMUIvdHNNUTFTOTg5Nm4vT2N3NWlpaXFrRDlpQWxZTUZC?=
 =?utf-8?B?VzE2ODhUdnZGbW9sejl6M1E3R3hZTGdLWlFZS2cyQkg4b0syTUd1RHZ4Q01C?=
 =?utf-8?B?amdOTloxZk1qQUdEVzYwUjl6V0VHaHNGOUFhUXpJa3pRY2o1U0VhektIemxl?=
 =?utf-8?B?cEdQSlBCc01xNmdESDZhc0REcjJSR1ZRTFdUWGJSUmx1WXB2eldzMGsrSTZw?=
 =?utf-8?B?RHN5RXpaekVvUmNvaHNCSTNOOThIejA2bXQzUmJpbUhsczNXTXJtemQwOG9F?=
 =?utf-8?B?cVNienc3SlNZM2hVUTMxb0UxREs2R2dNQi85NS9KN3FJWUUvVUJ0dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ac4848-d9fd-4253-afd2-08df1962a4e3
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:05:57.5476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLat6kgXB2Kg6gKfH1zhH8OzMF5dqPki42+DYmA2s0dirLQWneioCHvlDAeAjMdBZ71Woj1TpSS4BJyr32mWamsrvSCbUbJMn8/a3wwl6RM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9126
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 11:06:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10608

Hi Trevor,

On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> Several kernel metadata examples put a filename label inside the block,
> and some go on to hold more than one file, in more than one language,
> under a single "::". A block shaped that way is not any one language, so
> it can only ever be shown unhighlighted.
> 
> Split them into a block each, dedent what is left, and move the
> filename to the code-block caption, which keeps it attached to the block
> it names and renders it inside the block's frame. The theme centres a
> caption in italics, which reads as prose, so it is restyled to look like
> the filename it is.
> 
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> # rST

No clue about the CSS part. will let Antonin have a look as he's 
reworked some CSS recently if I remember correctly.

Thanks!
Quentin

