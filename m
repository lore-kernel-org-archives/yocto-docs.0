Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781CFC7EE2A
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:18:00 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.25])
 by mx.groups.io with SMTP id smtpd.web11.20945.1750688274114023563
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 07:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GuY+gKWy;
 spf=pass (domain: cherry.de, ip: 40.107.159.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peoZcJsfcL3SgKoLgGuU/KIS4I7Yu7qZb40IeHyutrvwY9iWZ1NLEqovP0/ZeAP53bDGBBYg2zgOOuMcEsd96GqRX4bM8L5BTIbW/PG7bsJ+aXIh70ZSwp2D9/CgVTzhuh4hbQTcXfKFHumu+73N5+Cld+Qr3MRCEDjyUd/wQHPVRflAFK4DJZrEaEEq6CpianbYgqfMUb0ykpoA0mgnjA2/n8e3dFnglBtIj7hMYxbk6Dp1N+RvXROLpslWlfFaLIfrkQq5/8LLifLMSERXNvQnmu8Ib2Nc7gHyxGeE0pVWk4LCLM+z9EaESCpzjN+2O2c3L1QcJ8RD7kLSWcfUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1E4RyGNHepfdrBW5y1RwgU1/1V8Ru9HkzFZiCABJZ0=;
 b=jYq0QNn11NZjMymMbdrxuh3PcsNXb6fwoxWr7mLwPVtcpiWP9B09eHIBzVHAeA0wBc4cG31Ffd8d8/N4v6KcWjOPZm6smH9tteTmdgm0qutie+ZT9UUPLqPRM2bt7GZJEMJbL6WbACibfnjr/BTijGvRhkxIXGEinQHd4juUj3XX0jQkYIQfi6uA21auldjTeY0EsnfROqt4xb3JDSshk7O1eM9X4IeOD6jpQBXm+EtfS5HO6+kaCwI27ZqSYCS+tOp9iSoVI3k2JA1iwABNToO6G/ewg1+9W22lQ07zxAyie4umyjdrjlp3FZMVpgT1tueBwCl1vzhwmtDT5PCSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1E4RyGNHepfdrBW5y1RwgU1/1V8Ru9HkzFZiCABJZ0=;
 b=GuY+gKWytrlFPzytawkOkJsSk6P8+wpNcQ00spqOAYzEiOTon7AiR4mXv2T5srwQHqVAFuJFPDo55jaXZLQQzJ38joI1gavmTUFdypfk7nsFsXbheO0xzpKg1hvchbWaNHMVxjr98HfsivG9PulSc7d2nKyaTpc4yaB9tE9wOgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8512.eurprd04.prod.outlook.com (2603:10a6:102:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 14:17:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:17:50 +0000
Message-ID: <5c391f5c-0629-4745-8bfa-2eda3f4fa323@cherry.de>
Date: Mon, 23 Jun 2025 16:17:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: correct misspelled reference to
 sstate-cache-management.py
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <bca142bb-16d5-d893-5d4b-a0538b38720c@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <bca142bb-16d5-d893-5d4b-a0538b38720c@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0089.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c34004d-8a6d-4942-8f98-08ddb260bc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3R5WitkZnlHWHFrYkR5U1NNYVdySXBud2I4RXQ5NHhMa05QMWtsU0xHeVJa?=
 =?utf-8?B?NDQ4dlhma0pmeVI2NlVjbDVTN1RLSk9xOGFMVC9NNGNCSk1BSVBYMkVIQWxz?=
 =?utf-8?B?VDdLdmg1TGNUd2hUd0JOVWFDTUJ4Z096NFhIT0dHQitBclRybkh1YnRvUTVt?=
 =?utf-8?B?MkVpeFFNSmsrbHJZL05DUHVuWmNlV3NaR0ppTjJCcjllOWFoT3lqSml1eWhp?=
 =?utf-8?B?N21VaURUVFBDNUU1QmpqS29aL1pNVzBpdFVreVByUzhUS29SSWhaYU1RNmNy?=
 =?utf-8?B?bW8yRENIRVZxMW54SU5SdHN2YUZwVzZxRkVqbngrSVJhdGYxVjNUYkRNQ2Ns?=
 =?utf-8?B?Skc0NE5vV0pOOGVlaTErOHNyQ2kzcW5mWXZNTXhCN0ZNZHhQaEN5RGZuM2tT?=
 =?utf-8?B?emdEa0huRzlpRjh3bjFLMnp3RndQdUVUcnNRZ0FadmRYMzRBK0UxY05PckZh?=
 =?utf-8?B?eU56TWFSSGt0QXViL2dYWkhVNFBkQjdtM0NvWlJhRHBLWXo2V2tmZUM4cmd6?=
 =?utf-8?B?S0N4dmRud0xMNkRXc0FKTktJT1NQVnhyTXhpZzI5UmdKR1plRXpramtLaDlH?=
 =?utf-8?B?cVR4Q0ZEZXQ5aEpJellSY0lnSkpSQXdTMFllVTg1eXRLMWV3Nk42L25DS2JW?=
 =?utf-8?B?aEhSSGhDeHp1RlBCQmlTSDJhMk1XSTZ2NHJUS1ZGckVucGgrVWR3UnltUGZY?=
 =?utf-8?B?eGMyclRnNGg0ekhTWlNQejdHMUtSNDVUWkxPQXBHSlp1Mm9Ha1ovT3lrWjBs?=
 =?utf-8?B?M1B5eGg5c1FIZUhrZkRBSWJORU14VnEvVWN3UElWUW90MzV6REY5clZ0K1V5?=
 =?utf-8?B?Uy9zNFdwU01QR3JnK29WTStzOEhBYTBZMEY0OEZRSnIyNFArMk5leVE4S3JI?=
 =?utf-8?B?dDNrbU5LaHNqM1pZSzFEUmR3WE45SG9yY2FESmJRSzc5c3g4RnZpcmp6WEU1?=
 =?utf-8?B?eTF6bWJJbkRzdFEzL25oNlhFd1o3c1dPYXVNNnBXLzBqcGNEZkxOL28yUDJt?=
 =?utf-8?B?WUdZUm94aFRjbkVLNmcyREFEVldHM05oTGVlNVFxV3BsZXlDSmNPTEJsTWNY?=
 =?utf-8?B?dHFTRVpjQ2RhaW43NncxZitzYnFiMUJqbVI5eUYxakNmQTR0M0loemFFSnBF?=
 =?utf-8?B?ZkNLMTkzbGZjamQyUlF4RW96R2YzNmpTZGVHeEJnWk5aeTZ6NkRwSndTYUcz?=
 =?utf-8?B?aFNIVjBRWUZ0ZTFtaGxndTRXQS9Nc1hLajNMSE1iTUgrakhLOURHdVdXaWJu?=
 =?utf-8?B?bkNyZFgvY2FDRkpDZVVndnR2NTgyU2FLM29HUC9NNVc2eW1uQnJrTVFDNGto?=
 =?utf-8?B?dE8vQitlZVZBb3ZNRlJRN29RZnNGb1VxUDQ3UDdOZ2tKemRGdDFYWGxUQ2tq?=
 =?utf-8?B?eHhPUmtKQUpieFU4NzJSUDhiS01zNE1nc3ViaVM1UG03a09VUTBveStvUmh1?=
 =?utf-8?B?Z24zNTRzWWtkTUZLUkh4eVMzY3QwMlB4QTJ6emF0Y2ptS2d3eWlONERQV0cx?=
 =?utf-8?B?S3ZkY0JIcXhNY1NDVjl1YzdVSnd5NEZmajlpWTFlWEhqRlc3bDZVV3haa2ZS?=
 =?utf-8?B?WEpKNTlnb3VSSzYyYUVtQmpuZThNMml4UDdGRllRZHdzQ3NSNDk2VGRPR1JS?=
 =?utf-8?B?YzVDM2srcjRvMEtFREc4TEYycmZnZFFMOGpzV2wwWnRNRW5zak1tangwNjY1?=
 =?utf-8?B?ZEYwSnE0Q3lQUTNUNGtEZ25IclErUE5MUVBxYjFybW9GWnBad1ZzSU8vMk0x?=
 =?utf-8?B?NTJPWXhMWmZraFpZR0d4aStqN0kyVjVmdUhNYmhnQThjeXdqNDAyRjNMUmUv?=
 =?utf-8?B?ZkFyOXhiZWtvZk5YQlhCTlNlTS9JcGUwd2NwVXA4a2pzeTJXUXBFSXYyQmFC?=
 =?utf-8?B?cUYzK1JtU0p5OW5ITWVMNzhLbEE5Szc0Tk9TNm0rVkV3RWVLTnQyZElRUnRL?=
 =?utf-8?Q?oxUIxaDGYM8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHZHSTNVUEZTNmNLMmVPTVZCNTZQKzVndGR3Vm8yTSttVlgxVlpteFhsZGZv?=
 =?utf-8?B?b0xZSVhlN1BSRHc5Tk9WV2xEUWozK0ZiSitTMFJReUt4L25HS2lKaStnNVVS?=
 =?utf-8?B?YmN6WDBZRURTcjUrYWJiK01nVWM4ZVVtSFRMNWgzSlUvZjlDUzdHWXNUZU5j?=
 =?utf-8?B?cEZFU2lxMHdnSTR6SWYvYjhIK1dtKy9DdmJ0bXVubkp5UUhoRUJUY3RqbU5S?=
 =?utf-8?B?cHZ1RTMrY1NEODVHZ2dhU1JGL21sMzV4NUVLcDNVQzNoam9hMVUzZTAreTdO?=
 =?utf-8?B?K05NYkNRdGlNaFFDVFd3Y2IxV1dKc3hGWjdyd2tNRkJpWngwV0pLZElpdGtS?=
 =?utf-8?B?MkIyeTlsb2IvSXJpYkNDQ3dTaUd2RXlseGdKR2NINDF2c1llR2djMGVjbWpW?=
 =?utf-8?B?dGFuU0xmV09vdndVL0dZNy84ZG1JaTB4TUZxVVVLRDA3ZlpVc0lnQVFZTFNL?=
 =?utf-8?B?QU9rb1E0Rm84aTIvTVlHSGFXdmd6b2RjSjMwZ2UzZEszaVhPZGk1WlN2K015?=
 =?utf-8?B?THdPajJTZ2d4MUMzeEV6ckFvY3NMOERuN0I5c25UN0Jud2FOcDZlSUJaRDNt?=
 =?utf-8?B?UUFhbW95VktDQjZrU2lTaGFXTFA0Nm0yOFlDTmZIS2lQeTFrdkNoL0hQczNT?=
 =?utf-8?B?UEFaMWM0QXRDWjBoYVREWDEyVDRkVFpQUjU4NGwvYUl5d2piLzk1aUVNUUxR?=
 =?utf-8?B?RzIxTm5IVi9QeTc3QjQwN0dMMFp6bXd4amVrdmFOZ0wvS3JoTXVGdHZUNTFS?=
 =?utf-8?B?SnZ1MmNSdis1TExrYktzNUJaZUljV0V5NmxpTGVEakMvbE43TzNvQ2JseEcw?=
 =?utf-8?B?Y2gveEk5cktyMDg1RUVHV3J4Z2dkWmFiU0Y5STVNczVPNUcxVGE2ODA4bW1v?=
 =?utf-8?B?Q0cva01Ldy9ySW9YQ2RNWWpLYjQ3MW9aUmdtSHJ0QTFVNFh6dW5IcWNwbFdo?=
 =?utf-8?B?MkRuekpzQXFaQjB5dkZHWG5BRHVwMVBXQndmNmVVUFdNYWJJekdnU0huRmZM?=
 =?utf-8?B?amxVV3Fpd1RSaXVvQzl2Sys5eExnZ2JSczlZZUtNdWxQeUdMaFdkbkthb2VN?=
 =?utf-8?B?MGVxcVFZeU9nZThZcFNlelh4WWwxSHhISGk5Y1RQZnBtTUZXUGZjbTR1LzlF?=
 =?utf-8?B?dmtlTWVrbURsRm9tblNCT21KV3dZQkc4NEs0dFhWbURPazRhUEViUEhmVTZm?=
 =?utf-8?B?N1FPbWZOczUwVytOR1dmMC9wZUtVTjZEampydEt1U1M4N3pNYVRDODkvMWVl?=
 =?utf-8?B?R0NHTitXKzJnS2xzdy92MmZaWHorOVovNngvSEQ0NzRqMytrOHM2Wk1HV01M?=
 =?utf-8?B?WStlbXF1ZktFdGJtdWc0RXBNbGVibWlZU0Y2anBwTnpwTkhEQlk2VjBTaWM5?=
 =?utf-8?B?S2I4VlFEVXVSeGgwaG95YTJ2RDVieWZ3QUlKVUV4WTdZYVgxK2c4UzBEdlZa?=
 =?utf-8?B?dzVXSnBkWVA2aFh4UngvSkpGaGxmcFlFbkxGTXpFWGNhbjBycVhVeUZxaFh1?=
 =?utf-8?B?dHU3UUs0Vjg0aVk2Y1dVZ3NRekdYZEMxaE9naVRUclhZWVgzNUpibXFBOFNE?=
 =?utf-8?B?emhnbmxMbFRIMjliYUprWjV0YUFHM2VDNDRBMUlSNUpsOEJJdG9HdENLZXo1?=
 =?utf-8?B?M3dmcExPK3hGSitDOElSbkVWV1lrUHZ4ZVc3cnNOU0hxVTM2MUQxaTRnSDRC?=
 =?utf-8?B?WlJpOTV6d3QxVXNneGwwRG5iTWhpbjRuM3BKeC9ocHdmVEJZZ1p1bWVtM3kr?=
 =?utf-8?B?dzlxWW1rcDZvMHBKM3hEY2tsU2JDZ2x1RWtHK2MxSU1ROWpabHdHeUdqZXNV?=
 =?utf-8?B?Y3praHZyWm9MeHNVUVV1OTB4bWpGYXppa1J1NHZwYjU4ZnhBZ0tJaGgvVzh3?=
 =?utf-8?B?cEVJc0JGTWNqbzVtR0JNTm1vNWlNZXNaZkVrdkJWNGFwOHJ3dmtJUndTMzE4?=
 =?utf-8?B?bkUzVlhtREE4MjNtMHl5RGlHaFAwQmRhNGZGVzZUK0hVNnRjc20rcmxtZExV?=
 =?utf-8?B?YmpINlFpYlByVHo2UlFoK2tiRmQzSGU5WFNhZDF6eGd1SEFLbmh0dU1JYVVI?=
 =?utf-8?B?OFNJY1hmT1FqY0V0YzROV3lTM0ZSMXorTFhDeFJzc0RlVjlQZlU4dFZkOVRQ?=
 =?utf-8?B?Q3JkUmJSM2kxVm1xTHRPNmNDNVg1L0JBTWJJTDk3blMvcUx6ODViOVJ5ZWVu?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c34004d-8a6d-4942-8f98-08ddb260bc8d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:17:50.8633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/pmF9Djjc3DxZ0mM59iexs+zK9N/dipv54Lt76b/LZfEBt5tpDfZabQrkqiEwXESz49Jpn/fh8LfzK4nA5hPnkP1y74YdO1mFLuY1dvNL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8512
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 14:18:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7159

Hi Robert,

On 6/22/25 4:34 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 

Please consider adding a few words as commit log :)

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

