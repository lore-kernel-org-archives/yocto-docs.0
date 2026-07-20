Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D95FC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:37:51 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.383.1784561866757301316
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 08:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ighD2w4h;
 spf=pass (domain: cherry.de, ip: 52.101.83.4, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnKE8qxbIy8QcunpRTVe9aiabbM9AJLtpTE30iB+Ley0zNFUq5RMRyXA8IlpsVdNnUAm3CVRqnuSH+elXbBFLn7B4gGNYnpMFQl8EvSKPI3yZ6alZQNZQNQ6c4BDUAVc+TCjn9orhEaqlb9LMRWbb0RbqMVtaHKSxsqDvChYWQKrtd167ZN1M0QVvtxfmGaRcgc0Oc9c9hgZ07ASHPjZ8K+dlTxgcYZ+5+g7UjyFg57h3oqXLt9b16fAYSabSgZIDb9nk7TO0VOhJNp3ZY+DmyZRZd7vDnY5ZmQsQRjjgQI3/jn0WaIuXIQlZRv4BMIBaVgle5gL3ryeQ25afgOapw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPvdOd03jARygxGDuoOfKfZemploubJYQNVhB5L0hrk=;
 b=cHioa5+I9ATU2xYozPtDxVebVHvWobskg0+8/fKY/nkiSbAkI6zT+1KsOXazRYzEUtlDBcG3HoeVT/AKzRFKACPnUIUQPhsExy9Ye3ChEbDx/tJsCn1BHJi/O3Lf3+gVKtRDSrOBu9mYIPOAhXeP4ycsojVC7tri8lpgBSxfhONN+LsX1i1JH621E2mhEegnDeJxaa6BeK1scTo/KezyTS0qsLnv4dRZP4pIi7Y6Gji5OKecnnb3VptQl+sE3cKiF/gLnvesmjZnw0NAuuegi/XZF/G+V18hI/Y6nCLscalTNc9quzD6euhjutqWojhtuYbf6Tl3dcUcjdfYi2L93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPvdOd03jARygxGDuoOfKfZemploubJYQNVhB5L0hrk=;
 b=ighD2w4h1Q1zo67CmgNTrlNUS4SvEFMrDZzr+j43R8JWuUmVOY09nUersUEipkfGHIIYcHrmwNjRuQPVn4FdO0z2wQdKSvkDYy9kDkl8wPiL5IoNL+1vJxgROaXDvD64c6ZjVUdZnMxrLaPop++U/U9rLozMxYH/fFMuKm2TNpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB9710.eurprd04.prod.outlook.com (2603:10a6:102:268::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:37:41 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 15:37:41 +0000
Message-ID: <53b41465-9c01-41a8-b906-9ee391303335@cherry.de>
Date: Mon, 20 Jul 2026 17:37:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] is yocto-docs considered a part of "Poky"?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <79d2d2d5-f9d9-a8ba-a43a-8370230a385f@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <79d2d2d5-f9d9-a8ba-a43a-8370230a385f@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000512.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::666) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB9710:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b340e57-047b-4fb8-5aa6-08dee674d605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Rv0ETGFvCcGPwkqLkT8qp8V7dM+MgZK65GJrdlvWfX/ijsHFnpDfIiqYWjR+3GDypYhgqJEpbcb+tfdHk59lnup2xtI1TSWO8JJSUw4sDysOvxWys4f0PoJVsxXyYvuChxhFMBPfNvoBEB5yWO/2H94FNZKBzdxRhW4AvwYgT8hl/Hs/KcmC4QDXpOhQp9MxAf1dzw3FACBbDu23LNEjexnF8UbB4ekttLQVcOeQUbcW8djidNUB/QXfBQ51Tq8fVKxREdKWhioW4lHpMUcArBwJsbnmlmHLdK45ExbOE8wp2BlGeTuhmA/QVlgfrg6fFwa2svREPrqmIVhLusDGkZX22I80C8QKKxv9fJNq+09EVaJrVDS4zLx9o8Em33LgwKJnvxzhXdnvS1BrtkxNYDay2t7R0pil0gqpsaF+pKUsDuMBCXTomUK2qFghEBvDLraRGocjHu+kRlcJFF/tXuefu2rM9jUt0idiPcZ8EnOM42GS1/yRklJXNcFBYrMemF20vKQJ/mdtWerRAh2ls7CkDAYDK9D9gjpw1ln18E1SRZaEsKZEmQx8VLiV+wdl9f5QlmVrYTNXHhnJqUS3Pc/6d4qHVc3PqYaHgJcb1zg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M09sU21hcmNvZmN4KzhmL3ZMUzRjb1V3cC9UTndBckFxd25QSk5IT24vcjBi?=
 =?utf-8?B?S2dkaE5SYktOVzZOT0IwRGpZWk9zbTZpc1JlWFhpMWJmQ0k5SzV4SDE4YWFV?=
 =?utf-8?B?UWJEckVGVEg4bzFGb2d1MUxLNGtiSTZPVVNhSjYyalVRY1lxZk50NS82alFM?=
 =?utf-8?B?OE5wclJyM0RMS1E2QnRWYzlVMGE0czlHTUs5UHg2WWtaV1BYQnhJQy95eTRM?=
 =?utf-8?B?TFV1bGxyR1RaVGNxYnczaDVYVXdnVUhmVWYxTGozZmNDbWFhaWFMalhHeHJP?=
 =?utf-8?B?L1NXSlRTMzVIa1c0ak1DaXRkN01qZ0FNQmJyQ245K0M4Zks5aWt1SkluWHJ1?=
 =?utf-8?B?U25JTzNFRVE5S3NKbzg0WlVoTVcxZ240RFRIZVFJM2cxNlYxT1d0bTU1em1l?=
 =?utf-8?B?YjBOcmswcHNWcnd5c2NDZUhIWURXRFNHcTdEVDhBWFZBSGdjR1ZIVEY4OU80?=
 =?utf-8?B?LzgycFlxVmIwMzlhVzg4ckdsdDd2YVRWTWl3ai90cHIyalhxbU00dGVwckhy?=
 =?utf-8?B?THQxR1FZOWlVOE5hbk9SN0JpcXJIM0k4SzZhMmZIOHhVK1Bxb05teGIyWTVF?=
 =?utf-8?B?VVdLZGN2Um53Tm1ES1JVdk1UbGk0VVJ4eE1ZSmRuM2RLSXh0ekZiNTVtdUtR?=
 =?utf-8?B?aXQ2Wi95NW1TVDZxbmNWOTcwWUc2SldIUE95ODNJbEcya3VVVUtaNWFUZWhT?=
 =?utf-8?B?ZmhCZm1RYU5VbzJYbi9xU0t5UFlJVjFxQll3R0NYUFZlNkl6ZnVOL04waHJk?=
 =?utf-8?B?REVJWDdYNTZEM0tTaUM3WkJmUTNUNGFwQUN2bDF4aG54OXdQSXlBbUJSaG9V?=
 =?utf-8?B?aGp5UHpySVZIdmxmVjJGL2pZYzNxZlJOUHdkcHB0QWRXRm02YkZYajBTdjBZ?=
 =?utf-8?B?Q3IxTmlIZUtaMDdCRTN5VXcrQWFjS0w3UDZsTWhldHpMRmVMVHNBTDFaUVQz?=
 =?utf-8?B?MnY5WWFodkk0Yy9wQnRTelU3aWFZV0d3NXppQTgydStmNXdnbDlSWWk2eDFP?=
 =?utf-8?B?TVhoa21aTSs0RVVvTEVBSGtPUTFNb0N1bjcrSEVGU2p3cjlySjZqb2wyYmNh?=
 =?utf-8?B?RlhLODl5RUpDaGZOM3orMXdsWm4vd3ZrRGY3WXJVdVdLcmw4emV0Sk85emtG?=
 =?utf-8?B?bUVsZlZEV3BzN0RIQmFha2JRVVh6RENVWjRTTHp1SmdzQk0wb2d3RmdOYWhi?=
 =?utf-8?B?dDR6VFhIUFNHRjZlaHlSZWU2cFliQ3h4UmxZOTlvaUYwV1cyUkFqT3d5N21x?=
 =?utf-8?B?MVRVblZscFVZcEJiU1gvTkFucU5PYy9UcG9NU2d1OTBXUmdPelNWMUxTdU1M?=
 =?utf-8?B?USt0cmJEWlk1ZWFqdDVVOENyUHA3UzBkMklLWWlMV1FEYUJpMm94TjNKS1lq?=
 =?utf-8?B?R3B2RjI5UW5ZVUVZVTl6Rm5hQWhkZ0pZQXFLNXZPVWhjVUpjYWRvMCtWMmZ3?=
 =?utf-8?B?bUtHMy9Yb1ZRYWxVelFBdURoWkdpeHRxOEdsZHdiTmxyS1BHd0hRUWhpSnhW?=
 =?utf-8?B?b2p6aTIvNWJsanFOd0V4aHJBaHNkZDMxckgwOGF1RGpvZWxtTnBmRG1YRElK?=
 =?utf-8?B?Q1EwUTBhYzlzUG9MQVZ2S1NtUDZkUkdaMDZtSTc0UEh5d01TQjBFTlFLaXNZ?=
 =?utf-8?B?QVVxVis0SmNNUld1dXhCZG90Sm9lTlcxamw1SXN5bWN3M0ZwVmVtV3lTSGFi?=
 =?utf-8?B?elZReDNzNmUybHYvbVhwWmcySTc1VmNUaVdHWG9ST29CWXJUaHJscmg2NVZL?=
 =?utf-8?B?eFNDQ0pETVFwMnpvbGo3eVFyK2lUbWVpajFmYlpyaWorTXJFeXhBUzloMnpC?=
 =?utf-8?B?SXJidTJjZk9GQ3lDQTMxcGJHQXRLS3ZsT2E2SDdvNzBQb08rUmdiTTRMNjNi?=
 =?utf-8?B?WlltRFlvaGJaOE8yR1ZkNEV5N25UbFNMeHMrL2VwMDk0R3d6bCs5YURMWEdS?=
 =?utf-8?B?YUFnNDdFSmlDQldwWG53ekFlSUNwZjVLeDRnZm8zRVZwWkZneHdZNnJpY25T?=
 =?utf-8?B?UmlTLzVyMkVtdFBvMmVsQnFNZXVRQjUxc0tQZGNiTWs4dEd2ZXV2ZlpPRlJF?=
 =?utf-8?B?WEJKT2l6ekxMSkxYQkVPV2R5MjhMV0RVb3hnV0JnQmpHaDBtRk9mL0JkR2pC?=
 =?utf-8?B?OEdQQ3BFUnN2NmFtb25LUEVRWi80QjlodEdFczM5aFBVbUhibHJDbU1pYldt?=
 =?utf-8?B?cTJOWEhQTUMyMzV6SUxyT1kwZVJDSjE0cTVZWFBILzNKb3VVZlBKa1VCbWtF?=
 =?utf-8?B?VU1HemZ5a0wrek0rMnowd1p5YkpCRk95MDBVUjk2ZHJsc2EzZ1RrT2NTanhB?=
 =?utf-8?B?VmxUUnlBZmZJUmdHN29PaDA1ZjZlZG9FYUdSMUIzcWRRV3piM2FQZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b340e57-047b-4fb8-5aa6-08dee674d605
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:37:41.6113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHZmk5bH0hi51T86qiTT/x2swOVv2KiND36ELzoi3jcVcrjm34FdgtwGP38wwaLpDRHj8aJTm+/jUOb8Ad9xV8NIx4ZZs9A87zUjY0U8Q3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9710
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jul 2026 15:37:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10098

On 7/12/26 3:01 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i've seen that claim somewhere, and it didn't sound right.
> 

No. poky (the git repo) was a collection of multiple git repositories, 
among which there was yocto-docs. See 
https://git.yoctoproject.org/poky/tree/?h=scarthgap

