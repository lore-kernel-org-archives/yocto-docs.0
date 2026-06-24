Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C8ECDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:38:40 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3334.1782293913491688949
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 02:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nQzaObSr;
 spf=pass (domain: cherry.de, ip: 52.101.83.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8OipE7naXrvfI2+TOZXAQEWTQkpyO0JrVtdIhHrv/eddwjxN6+xpH3/kEGS9B0aSPeebetDRuX5+7qefiVz+eoHo6Pua9+xm6E8R3jBY7wtuFDRxZdQLwv0OC6UebULEBRJW4l65k/gS3E/Ss3WiOln15BAvCisuOKvukUr+Hu5ihU43PwsTE3Fhhw89dWcKXf8qujdFxYQCoAILwWNMEYSQlocEqrnYsKTXxHmQAu9QSvjhr5VaAgk/1/WTO7TTl88ZbMizb1x6dPtlZcj1rbh1uMVc8ionq9NB8oeYu4G6+EaaLOj7p76fUoQbl2D0ZbUuA/yU8aLpM71I4Vvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHUMF0Q4akvwrmlyqs/iD0vo6jA0Rt7ysUiC6EOgZJk=;
 b=VrPGtw1I7cTtFTgjheKBGYUmMNZorZ8b3iWavffsGfX53ml1pndSLeygwPTlCEIuNIxA/xu7qqW0mGpW3trraQSDjKTFv2o+kiIuYbi5mdhf4Q9l+Pg+hcISIGGEBc0eYCiVK4ZfP9AV6zlJODoq6BCmoPNTYM8wsrB4SJM8xjKukxci/+RCQkDdVrAQJwu6M84JpCb1MSQ1lT8LcZbzAXgQyO/Kvw8wDHfjHKGPGEee2GoyU7sbAcQo1TxJU9d7PePBrbme329TuXpTPeQB2xWKFTUpGRS9rSX0FsotuTCP1/prE1h7F7Yn7nAw8d/ub0uYv6bA0KK5Q57EesIgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHUMF0Q4akvwrmlyqs/iD0vo6jA0Rt7ysUiC6EOgZJk=;
 b=nQzaObSr3rKerPqf7YF4gi75O4OYdr8Yb+WgLP5WZ/viNhJw4/kBYXw3MDsSG51XcZ71tTOGdua3vJBk62FOxgIAlrRuAXTV81XTgBv+UP/u7vs1mECIJs4GuH3ONtHcV+NOlcShba99KM8As/GQUEEl7BXeWfCgKb7OBHOC+8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DU6PR04MB11206.eurprd04.prod.outlook.com (2603:10a6:10:5c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 09:38:27 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 09:38:27 +0000
Message-ID: <1a4fd76e-e56c-4d54-bf18-960553daaedf@cherry.de>
Date: Wed, 24 Jun 2026 11:38:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-guide: 5.1: Remove duplicated typo
To: jaekyu.lee@lge.com, docs@lists.yoctoproject.org
References: <20260624081937.3354338-1-jaekyu.lee@lge.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260624081937.3354338-1-jaekyu.lee@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008A9.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::649) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DU6PR04MB11206:EE_
X-MS-Office365-Filtering-Correlation-Id: acc1c07e-9f16-4c21-e506-08ded1d457ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	PuuRf5YN26jtrHAaPTvnILiQZ57VIt1avFisXKi09v+CwabgAyWvLveMS7kM+K9fah4hhnYa5FmrIKvxDgYpUrFKkFQ5+gyGDahu4/7CUINfEto/s766o+Lvii3qoYGncRwiAAB7iELjMSNyHicxjwYtIz8DakP54zhqKaJTTcx0ZFLSc0qje3ldp7UKPJaatDB3PzXTSQJLq8ktasXBG3m/9/LkoWMhqnEpGpEtGDzTtm+9HQbgZOdX4Vn5M8uTbRBqqFNV0Z3f1AprklhCEE8SjUkIlrjHsOuofy0O6CX5ihlKgAN307bsKl86QHO4MwONUBgBmY6Pg4NY6ggkZNL/Vl3DVQFp1XqAOFWFU/wEbi0knqgH/O6DHCwQLqQlknt5Vr/Oth2tvc6s3aqtwXKXDBN9fhqHFHlDGynMJPhIkuRv/g/NjFkTkH2XdYj9zbYso0jaMFUSp0c/agscufKIRW6NVRIUsr5z6FRRLsp84EAgPGepd+E/YBtptTKCvHyOEokU2J+UDYWceKp1gAkuT+kbgPrRxL36ynp+oH0UAJGv/PkWQ3pJV6prF3o3UjgmeYLIkpclV2HRSiptdRTVvPSIrQKN4NuVs0rooFBkzbr3KJapfX71VYIvqyuR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RFU0RHJ5MWM1KzJ6YjFpb0VkdG9ycEl0UUMvVVlPN1pOTW53YVlYQlE3Vjc5?=
 =?utf-8?B?eGQ1S01qVE10L3UvdVRtR3RVZ2ZWVFQvcVR1cUJJU0Q1L2F5WEZWMEhhMEdt?=
 =?utf-8?B?VGY0dHVYcC9GbGoxdFF6SC9tcEs0Z0I2TnNwY01BUkRqT2UyVG9kRElBdlFG?=
 =?utf-8?B?Q2lYQU9ESWpJK3pBRGgxMHQwQjlvSlZkV0RoQ2Z4UEk3cklrTk42Ym9WR054?=
 =?utf-8?B?dndlOStXcTFMdUxaNTF5MzBNQXQ0R1J5UkNGL3Y0R3pNVmsxQjFSczIxWFBU?=
 =?utf-8?B?dXF3VkZPdmdjVjhqbVhBYWVIaTNNV05Cd0tmd1ZVYlpaNWpSMUp3UE0vUEtQ?=
 =?utf-8?B?dWRmOFE5ZVZBelZ3OFU3RlpRMnE2cklYaGFhSWMzWUMrOVl2blJud25rb1lO?=
 =?utf-8?B?M0o4T1RPOWNkSHpqbEc3Z2NOVUZPRjRkNmhjVlczejRKOFNzZjRtMnpGME9h?=
 =?utf-8?B?MEpBNGE0K1pqd3M3M1MwNitmOFpiWFluSjE4QmFLZ09EWjVnN2tzNFd1ekVW?=
 =?utf-8?B?Yy9WU2pMNTNlM3ZtSDA1NGttY0lIemFxcEczTlZTblVFR0RHNS9JUHYwb0R2?=
 =?utf-8?B?dE9tS1E2bkJtemRMcHR6YzE4MGN1bVRkeEdpWnNpWHNtZHh0bXZxUVdLSnEw?=
 =?utf-8?B?U21Qc0lzU1Azbm9hQ0VLL1JBYS9XeTFVbE9QazZJVWVOb2NMdkpYaUNjVE5p?=
 =?utf-8?B?enRIY1Urc05DTERxWjlzZnV5KzhJa0xQeVVZRnhPUlJya2hvSVI5MnpmckRn?=
 =?utf-8?B?OW9NcnRoVFVmZEo3UGZ6VWlXcDhrMmJrOVdveXlOSnVKYVlNTUxoc1d2N3Zv?=
 =?utf-8?B?TjFxd3JMc0Y0cFlDdWZrZlRzbjMvS01vQndDR21IT3h4YU43UFMrZDVWaWo2?=
 =?utf-8?B?TFlheVpTNXVJcVVETW1IenB4YlNKMHNOdFgrTm0xanh0TGQ2R1hlTkJiVzFz?=
 =?utf-8?B?cVVnVG1PTG0rZm5vbnZTS05nVm1vVWlqOWdiSC9UNS93U1V4R3BTNnNLanpz?=
 =?utf-8?B?WTJwQStGUnlWbFE1U2pHZUQ2ZjU1SXFUTlhQS0R4YzMzVnpzYlJDYzFMMFMr?=
 =?utf-8?B?NlpYcXNFQ2tiaUdRTGNCM2c5c041QnBCV1dVYmpGQ2svUmJsNnlnZElyci9K?=
 =?utf-8?B?UENBMHkzMzBaNWpiN1RHeW9SMERZTysrM2dpbWJCRDRNLzBoNkVIazE3QWNW?=
 =?utf-8?B?YW9pUzFhZDNzZHA5QTFzVzNiSHUrZTh3KzlWYXBIZW81MFFTS1B3VzJubEJB?=
 =?utf-8?B?dkZTYm9WRGM5Nk9hNThyb1pScG93MzJsTTJhSDRhU2JscjZydk45ZFdnUCtw?=
 =?utf-8?B?ak12YkdGUTFLNlBHc2NGYlNXQWM5Mi95bEp6Mml2Qkkzdmd6MWlQbW4zVFV5?=
 =?utf-8?B?U1Vnb0FvUEtuNjhrMzVNWVdCdmR1empSWmtJYTdvblppbk90OGFhUXJqOWps?=
 =?utf-8?B?SkYwbUEySHlBaENnWXpoS0o3TFl2MXVxQzkvZXozMy9wWmZOd29aS3d4Mmtj?=
 =?utf-8?B?Rm9PejhWdmhlZEFvME13c3pLNnFTTE9wTEVpU0dMRHV0VmloQ3Z4K253MmxT?=
 =?utf-8?B?L3dsR2ZtQ1RMWmhvT2wzQVJhZzN2amJWNFkveUoxL0VOc3lUR21iaUxaSFVH?=
 =?utf-8?B?dFJYVUVaNDlBeUVCYkg4Wmp0bVprUDlEbmpSOHl0Unp5RkY5ZEtIaC9URG9W?=
 =?utf-8?B?NVUrb0poKzFJT1dYMGpscXljY3FHNTlsMzhrYjRuZWdUU3pLd3F1d0t4eVdv?=
 =?utf-8?B?emlwekxwazhReUdWTjNvaDNpMFhoSWVWT3l3b09CUjFYTjRRNEVsN2pEVHl1?=
 =?utf-8?B?eUVGaGgzRzQ1OVZIeEZ6cXFlSHoxZVJ4M0hTU3phQUhHNjBDdHVMa2pSQ0pQ?=
 =?utf-8?B?T01pejJXc3daSXkzTno1OUhCajdVajRXd2RUMjlsRy9KdWR6ZWJZQkt5clRD?=
 =?utf-8?B?d2lLaTZpc3pzdHZseGJpYks1UjlPYlZsSmY0QTNYT3FFWTQ2cXhVaURENWZR?=
 =?utf-8?B?ZlJHdmpPS0dBVTU1RlU4SGpJUnZ5blM0ODVBTFhoRkVRSEtyT3dTaitUaGR2?=
 =?utf-8?B?Y2dSdmpNNmw1dkJ4YUlEL29jNXRibFg5SG50dnZuYmptQzdKbFlWWFR1cmdQ?=
 =?utf-8?B?QzlsR3R2Y3FEWm8wZ3hQaGVqVzYwMHRFbC9VY080YkUzWndHVVBxdEljaHlR?=
 =?utf-8?B?NTBHUWkyLzMzZTRRQ1M1NkhwMTlRTTBjOWpJanduSks2anJKT1Rac1pOMm9E?=
 =?utf-8?B?azVrRVhnY3RDc1VTbVhreGdpemhxT3hRbVdsZkQ1Um9rY2JYa1BqMU5wSUxM?=
 =?utf-8?B?MURmbFdiRzNNdkhZR204Kzh4azdwaGhtQkI1cHZIT1daNG9samdEUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: acc1c07e-9f16-4c21-e506-08ded1d457ba
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:38:26.9620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wg+0hb9O/nCuMzbRF2xxXpHgdhXc1mLzbjYP1CY0ck8uhuBTGnuc/xdOqj31KNaYhC0Cn2FzjOvT1m8fqdYoNrhH8+lULuybQMt60VKu9rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11206
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 09:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9853

Hi Jaekyu Lee,

On 6/24/26 10:19 AM, Jaekyu Lee via lists.yoctoproject.org wrote:
> [You don't often get email from jaekyu.lee=lge.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: "jaekyu.lee" <jaekyu.lee@lge.com>
> 
> - Remove duplicated typo, do_compile

Thanks for the patch!

We need a proper Signed-off-by here. C.f. 
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#implement-and-commit-changes

> ---
>   documentation/migration-guides/migration-5.1.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index 94b527bdc..f1c953c7e 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -23,8 +23,8 @@ supported, and an error will be issued. The recipe should be changed to::
>       S = "${UNPACKDIR}"
> 
>   Any :term:`WORKDIR` references where files from :term:`SRC_URI` are referenced
> -should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`,
> -:ref:`ref-tasks-compile`, :ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
> +should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`,
> +:ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
> 

Did we mean ref-tasks-configure maybe? Seems like commit 1f18b9a51280 
("recipes: Start WORKDIR -> UNPACKDIR transition") in OE-Core modifies a 
few do_configure tasks.

Cheers,
Quentin

