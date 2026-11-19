Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13971.1795092854904562026
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 04:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FMAasVuH;
 spf=pass (domain: cherry.de, ip: 52.101.72.38, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAMl7HC+uegDpdRnZjeOis0c5LUVb49zgt2oQKURVGP+65Lh1k3WJ3E16EmBsudf/6bCxWgxTV5hlkR0AL1jOK1XHnhDGwD8Yqe1hf24ieaU5Ute9+JVZi57IX1gbZ320m/87bHdwciLB2PHfIlS6y1gU0sqpXaBX3e/o6QwXJXuoRNYfNYiNegw8+mae/G9cp9WXTafpANHUqWsrfw0KnLtFYaT9dit7zC+3KO/xv78wvukNvrqSwIQDQrju7O4/7NS1Ms5ZrstJEPJnrPVtCwjGNPQjHl75CjQiGufdm37QJp6hKPAvzBX3owuCAyzk+CZHNWMMMD4Ji5VsAiidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2pqDLA969Js3GwmhuAcPW2NicXF+Z5y7tzdmJbJ5f8=;
 b=PkG72k4UlddvTJ9seE8YWVloFn3FejEcoupuOjzdv8gtubMFJvW2gakbwx8eNhkjbvG2+yUaPo4KwINbAYGd/psqYo0KAKwTPGU7pNEfI2Kz4Fy/fym+xAXDJ8VxspQ9bOF/GV0YPSw3w+wpGpGafRjbgqZcDmqXrX9534AoSPhR11mxMEVlbQSONGWoRinbOdOnt4+9Y974+3mnU/iOQdtJB/MJAtRhOWe89iOqeOBRl/2TSM5Da0aj6wLs6J6XMSVFo/Wd6YnW6tTjlRBy6yI1Xm7WQQRO1qa6DLzI3gfHhLiD2OU0RBkZiX0wEhwk6kbbIKBVSiOkTgKN0vyBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2pqDLA969Js3GwmhuAcPW2NicXF+Z5y7tzdmJbJ5f8=;
 b=FMAasVuHa7FVaFqQTcO8hvne5PEvg7BA2Fy6fmXV7qlRlFSxTyTwgo2BhRzX/pWlDULwWToLUr2RGVi+0TyzaIDprZ29iD6f1h1z91h43kLGvj/mHv6XyPblGR7gurlzjn0Z6K+pZzkesz6rfyFQZeD6wxX1818SnvvA6BPDaHk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PA4PR04MB9221.eurprd04.prod.outlook.com (2603:10a6:102:27d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 12:54:01 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 12:53:55 +0000
Message-ID: <550882f7-9c30-45bd-b3dd-f803f9e2b10b@cherry.de>
Date: Thu, 19 Nov 2026 13:53:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tools/gen-releases-svg: store docs root dir in
 variable
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
 <20261119-gen-releases-svg-fixes-v1-3-b6245fbf8294@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261119-gen-releases-svg-fixes-v1-3-b6245fbf8294@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::11) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PA4PR04MB9221:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3d2fbb-38a9-4026-47a4-08df463c2b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|261102123227099003|10067099003|261021121427099003|56012099006|261021135927099003|11063799006|261026121527099003|261021123027099003|4143699003|261009223027099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: tuZ1Ivw7pim5QNV1oSF2YVgVNBNFUlzlGYuBOhLHmr7NQxNJyK8ammkeEbGjHlhrw+9wt1CJ/syURiof9cbRssmmKJJ9ruXAd/N7m2264wApCmcMtg+A1Kb5TaAOAFJmIS1fJ5ATdXifYAd3QN6eFy6aY1y6odNtKBef3et21alB7J9H3+gHsIuGBebABbz2du8rI3qdaguSreNBGDCv57Fvk3X25Nt6IqlZzi/iP1vRk6BdFTg3Mma6zWFRW6Lx4UpDL++zXR5vmfaL1zp9s+c3quseWXt0GhGoreBEUAw13wWaJTeGdMmBJVGKrwwQ09m4I/VsxD/IAbC6ShMcm513sJimqvgdQI8E/OPoTdMLhocP2kASNnpB7LgiWy25exBIbqAQPSWnJXQTktYQHHja7HJUUhmvdkyEUeOV5fBbGaIQP2h5M+tKfZSZkKo+cRBjJx4QzsktN7i11mUuqvgD5lAX5Ogxl5XbG7emPqNmkGFCZp/I1Ma/EJM7Q33xPfUgbGi3qSGVyaos6YnupdII0CUCt+YWYWrYR1+Cqvmf9KKyLRicvysE19dVYx9/DbXmMdSLRPOGnyuOt9adRWrMcvYNmvwrdFfOM2g5e7JKNyqEu8pRAomVdcj4ZQnfwr6jNgEdlJklYRpM8Pk0mvGT+yBGTAlUIwEE5VseWcM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(261102123227099003)(10067099003)(261021121427099003)(56012099006)(261021135927099003)(11063799006)(261026121527099003)(261021123027099003)(4143699003)(261009223027099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHB4U3FiVGVSUWZwY0xSMzZGTkNNTHpobm1Ic2ljbzlKQXZkaFFSQTJJbUhZ?=
 =?utf-8?B?ZW5ibXpjZUtxeGs0cmJodTVDb3BIMkpSNTBoNUxlV0M0U2pZTnBDSm0yNUNO?=
 =?utf-8?B?Vm1sMEtmaWp1a0ZqZnNrTk1JcVZZYnFGejdpeHFwU1RDVzZaUS95SGMyVVAr?=
 =?utf-8?B?TElSVEZIT1Ezd3Y5ZnNJUjVuVU05TWowOTY4Vk1ZYWlCWllPK2R0QUJyaFR3?=
 =?utf-8?B?b256dzF6ZXZBQWw4YjNpc3VUN1hrbEZWWlRHVW5hRkVocnEvTk0wamt0SHIz?=
 =?utf-8?B?RUVuSndTN3FBZjV1dHFwc2UyN3dOVnlwQk9kZlg4TGNqWjRpSGF6aVBVazQz?=
 =?utf-8?B?VDhPWER6Zi9rZWV6eDV4M05tVGRuT3loU0xmcEx6Q2VaR2UxMXRpZFV3OXBP?=
 =?utf-8?B?UU5xeFVyMHU1NmcrZ2JBQTg2WkcwWDhoSHo2ZHhiQnhkb0NzSDVHVkkwby9h?=
 =?utf-8?B?NXByRjFJU25kNG5vMDRUTGU4UW5oMjFrWlJDOGsvelFWbjRUTys5M3pqaXV6?=
 =?utf-8?B?YllQYzZXMm50WDBIL0YwUkFvbWdzWVRoM1luWm11Yk56czV3aXhybENCU0JW?=
 =?utf-8?B?UmtsaWFmWWR1azdqbDd0YkZxcTBiZDZxN25LbGpiVHFFMWJZMXZvQjNvYTRl?=
 =?utf-8?B?S0cwbktvODVEVkY2bjNvMk1WUnBCNHNVbzF4TTRJenRmelFOS3lQRXEyYS9z?=
 =?utf-8?B?cm9hYTluRi9Kamc3bGY2dDNZOHBGczZKUmU2bDdnenhuVkIxeThxbkpTZTdy?=
 =?utf-8?B?Skw5V0RGYTRaQnNOUTJ3V0ZNNjhZTFJHb3JjeWZlVkdjcDE0eFZ2bGl5Y2JV?=
 =?utf-8?B?Z3FLMmpkSllxaGQwSDVMTG5BMFRGUW1SZ0dYQlROc2ZkOThsYUlKV3NlR1Ru?=
 =?utf-8?B?RTlaN0tIcUNnN1ZvSkxYSCthc0dEQUxlUFJIRFpiRzB2Q3JabTNEV2FTN3l3?=
 =?utf-8?B?SStQZ0lQaVB0Q1psblE4REo1d21ZaURteW50ek9CMml2VGROS2YxSCtqa0xB?=
 =?utf-8?B?OS80NXphRXpVSXB2c01zSnBQejhrYXpnd2ZDaVZ1eHh2RzBnSkRnamdyNTg1?=
 =?utf-8?B?bjdya2NmSGJpTm9XQXVKZ3JNS1lGbVlHKzlmTXNwZFMrTEhuL3lEZkV6WjVq?=
 =?utf-8?B?ODVna3ppcXpmQ1ZVbWRQaVNiL1V6VGZqMkFMOUpKcy9yN3pmVjBpVXNYMW4v?=
 =?utf-8?B?bXRwUXlXVkpZNkF2QmxwcE8rQmQvcHM1a2tXbnRuZmFjcVFzSjBCYmFuMjdI?=
 =?utf-8?B?REM1K1poNHF3UDRoRDRVUmU5QWRZTzhicUZxTGZPR1lrelREWFJZWFMvR1RV?=
 =?utf-8?B?UVVKSXNwZ0FRK214aFk0aTFMTktCNUZBc2FMd3dlT3IzSGtnbFg3dUh6M3U3?=
 =?utf-8?B?NTZ1Z3piUUFyM1NabGo4NzRpL2MwakdmbVhaMjJVdnNmM3ZhaEJ2SG00b0VT?=
 =?utf-8?B?QWhXaFY5OVlndi9EazNtYzV5cW5ld3M3MWpqazBJbWFEZDE1TytpZHBYQTBL?=
 =?utf-8?B?Wk0xV1U4a004MFNRQmdnS2hVdHJDR01hL0wwZy9WUm1xWUZtRVlGWDFLSlZh?=
 =?utf-8?B?QW5DRStFS2RuUU5IdlBvUS9TR05lRGZMSjhrVUNTTTFMWlFqRlU0cEFqQytz?=
 =?utf-8?B?dVdzUDI1ZGQyNjYrQ3JTM0h6SCtsd1NSYWZNbkgxMHVXQzVwNCtHeWdBK3hx?=
 =?utf-8?B?R0VINEFvQXdwUEJ3d1NEWlRkU2gxbkV6a2R5WmxQKzYwbFdaNmYxQkhiYmMv?=
 =?utf-8?B?Zi85Y0NZVVVpTEV2Z3htdTlCMlhNWFBHVitVTisyN0I1aXRyd1VLQmVRK0Ny?=
 =?utf-8?B?dlc4bEVnYVk5eis0aFBwc1M0UmY1Yk02VHA2bFlBSGc3RjVMMWUvVkZvYXBk?=
 =?utf-8?B?UlViWVZoa3c2SWtTaW9BZVBGeVBEdmRlQ05QVklXZnhTelNhWEVqcFNVN0xs?=
 =?utf-8?B?LzFzTm16YlJmR0l5SnpxbCtRZWtnaUhiV0VLVEx4Qnp1NEUzbml6YmNSdVhk?=
 =?utf-8?B?eVlWVi91azhnZkJXcW1ya0Zlb29lMGhDazJSZi81dTZjQzFiUGhvUjNEdjRR?=
 =?utf-8?B?TEdSQ0hiQTRvTkVyN2JGYTJTVDNHOE9tWXk3ZmcrUXdWK2NWcW4ya2JiZXJU?=
 =?utf-8?B?aW0yNEI5ZjVNbXdUb3VOV1QxMFBDU1Qva0wrdVBzc1lMSVRwQUg1NGVoZUNq?=
 =?utf-8?B?SUsvNDZ6T242TS9BL3ZvWWpTQWxLWjRVL3ZkOGhUT01IRFpxSE55MkN0VGU4?=
 =?utf-8?B?K3JGUmtWYXZLZHhqQnVMNUJETXpzMTVUbGFxcmY1RUpneGllNUc2TkJkUzQ4?=
 =?utf-8?B?c01WVm92OVFpR05ZMXFwajhwWjgwMDZMVS9oY3ZLQ0hUVWJGS3lCaWFxSlFU?=
 =?utf-8?Q?WIdrgBehUXKnkUyr+uPRD02vzhA+KGudllo+uUYXyCNO4?=
X-MS-Exchange-AntiSpam-MessageData-1: EzK2fa++sVUSSZdXCeTVhwYc5bkMPhjJAGA=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3d2fbb-38a9-4026-47a4-08df463c2b8d
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:53:55.6166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87S5c6j7cIMlHs41kRI2SgaxOOO490kHYcBnxTEHBCE/tdW27I7xr3LWHzVuj982WMUrm5cwRhHf/1tj9daNKEnltanFNvNi+ty2pXdER9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9221
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 12:54:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10804

Hi Antonin,

On 11/19/26 8:55 AM, Antonin Godard wrote:
> To improve readability, store the documentation root directory in a
> variable and reuse it in the default assignment for -i and -o.
> 

Yeah, that's... still confusing. yocto-docs is technically the 
documentation repository so when we say documentation root directory I 
could very well see people being confused that it points at 
documentation/ in yocto-docs.

> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/tools/gen-releases-svg | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/gen-releases-svg
> index 77281f37d..be69777ce 100755
> --- a/documentation/tools/gen-releases-svg
> +++ b/documentation/tools/gen-releases-svg
> @@ -18,13 +18,15 @@ import tempfile
>   
>   from pathlib import Path
>   
> +docs_root_dir = Path(__file__).resolve().parent.parent
> +

suggestion: rename and add a comment

documentation_dir instead of docs_root_dir. And add something like:

# documentation/ directory in yocto-docs

What do you think?

Cheers,
Quentin
