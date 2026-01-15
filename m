Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E32D4115B
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:14:02 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32357.1768472036126415879
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 02:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=d4sK52Ou;
 spf=pass (domain: cherry.de, ip: 52.101.84.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVl55JfUAE3xeDk3vih1Z3Umh5mhSzPjDUQiupOb9z+x1Go5wbKCogsee5TXDZG3PRPJ5xUffVWPdb7itdP/sknEzT5PRmK3bG3n1zdJws7pcFkO8HYheoEfX636f9ecLKvZs098CkTFTWR78pYBXsfb0veCXF5dTGyhfSe68LDnLLKzb5Q59oIfywaWqxLC6myUWUso1NI8eHKWd7+zS+moBUWpSwYJDDSy9V40+jnML9b5jMISiTqM5zx+ilZxY3qfguP/KWC143qQK4zRYTEsomFYDb148XATnCgHeBYc+8d3hFyzZ7shioxPUoM5HlOI2rwimMAx6AotqERu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg1FuXYWTCUJ4gdaP0TFLC7ehFYCjpHLHN33sUQpifU=;
 b=RzdV7FViPbbDBVVtatZnPUEnoIulpN/tFyqjEys4lzbAPi1zvq059vd+V4oJEdfwJOYWZYSbZs59KxwlV7I1c83mmFKsVbWYLhBFXdr5T7Njw20GMuDeiVyqmkmfZgSFa3BrSSKBEgbopnmm/xh2xZ66Ev7z6yJGHZ9keGi7DbxT6UZYnwn7CgbY/aXdrbiz8ng32Ho+m6s9KbSxUiJQSii/LgUZ42VlyW2WeaVBRK9Z7QGgVksd1d8w2d0aSy2EwyBZIeKMNf1JYOEmOOXVwDXVyN5D0fSdhT4jALUNU70uW6sPCgG4DrCKBUyKwdFpOK2ZTEEMarljQW92hOwMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg1FuXYWTCUJ4gdaP0TFLC7ehFYCjpHLHN33sUQpifU=;
 b=d4sK52Ou5kAytnowiY2GECHCbm85Lcj2dynXrTeDVGb4/Xn94cm2wZfh24J9rxCT8fMWZwTvHCFwQCIB2LF3+xU5iKKv8SNxDxeRyW9CsRqKPhKKtK+HIpvw0L4QDfMSJ/wu5FCw/jXkryfVxMo8o0r0U/sBTzl13k/mThHB28U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB9079.eurprd04.prod.outlook.com (2603:10a6:20b:446::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 10:13:52 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 10:13:51 +0000
Message-ID: <6735126a-c052-452b-ba25-4228e4dfcf23@cherry.de>
Date: Thu, 15 Jan 2026 11:13:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/5] ref-manual/terms.rst: refresh the Build
 Directory definition
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
 <20251224-terms-refresh-v1-1-691329fd038f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-terms-refresh-v1-1-691329fd038f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db2abcd-3207-48ad-1db7-08de541ec7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2t4UWduKzZNbnNYdENMWW1CWFVBMkEzbnBiZjliVUVHN0VDbFZqNHBvNXdI?=
 =?utf-8?B?WlZwWjlmRHRzME5XcWJCWW5KUE9Wd2hDT0RUdkNOTEdIS2t5ejN0bnBZYXlx?=
 =?utf-8?B?Y0wzT2kveTl3amNJLzQ3eC9WdlFWWDR5VWdIa2R2UjE4dUhLVTllYzd3Wjdh?=
 =?utf-8?B?TW44d0pYcWNVQ1p4ckxDR0ZTb3l6ZC9aaW9taFRyejJ6eFNObnpYcjMyemh3?=
 =?utf-8?B?TWNWZzhhZzVJQStmL1R1ZHVkTy83UjJnQjVSOWFyN3doSGVhVC9MWU9iNHV3?=
 =?utf-8?B?N0JRRjNiVVN6QWdhM1lpK2hvYzJObDhJWUFLaVR4MDZOYWlnQW1RbkpvdGVh?=
 =?utf-8?B?WWRHaDkweUhrdndZdllFTXZIMGZ6Rk90TldLbDIzblhLMXk3dGVhZzdpeERi?=
 =?utf-8?B?QzdvMnpMc0lzeG5ZZCtJMEpHV2I5cmhodWhrQjNyUXFaVkZxaHRwMUljbDZP?=
 =?utf-8?B?QmJFN2Q0dVVoRWNmRkxsM25XRTh3UmpZcW4yN1dheTgvMjhhRllyT2ZuTmM1?=
 =?utf-8?B?VXVGZE5PdlkxUCt0bEpEV2lNN1BWWlE4amNPdXdsbU9hdERLNFlkck54Wmsz?=
 =?utf-8?B?cDgzcjl2b3BpOE4wUG1DcnFNWXJIc2JZNFBiT3JZYks2Y3pqMTI5ZTBFdklQ?=
 =?utf-8?B?MGRXbVUvS1NSazQwRGxBRmFSNnBIbEdDL1pXczNrSHRtVnkzUEhVMCsrbWRy?=
 =?utf-8?B?MlhGVWZXNGk4RU9FbElNc2VSYXErbEx1Rm9FTG50Z2ZhUUpFckhKZkVGeFdt?=
 =?utf-8?B?QThXSkNzMm1RdEoreUZORUtCTUNEMHc4RTFKalhCQUZDd2RqSnBydlBJUHR1?=
 =?utf-8?B?MGNsaitDUVRyT3FxSjNrT1I0WVEzbU5CaWYyMmhjZ1RSbHVhNlBhMXc1c1Jn?=
 =?utf-8?B?NjFzRTVGT3U4U1hhZURPVUFLcnNwSk9JeS83bTBudytPMThNVTk5R2VDWFZl?=
 =?utf-8?B?OWFGTnY2QzcxcW5xMUQxdGF1di9XT2dTSUVFMzdVMXVhdTgvQ3kxWmR5dlFD?=
 =?utf-8?B?amdKeVYvRnl3S1J4dkkzU1hTQk5pMDU1T1ZLS1JtYW5ab21paXRYMm1mM0dC?=
 =?utf-8?B?VmZ3WVphY3c5QWxXZDMrUlpFbnhyZGlUWG9ERWdJT2FQTU9URnU4dUQrdjBt?=
 =?utf-8?B?MkNtekZ5dVh1VUNDZlVGbGdCU1Z2SDJBdWU4UTkwRUh2TEM5ZHFCcVE3VXZG?=
 =?utf-8?B?Q1lZaGVqWEFtWGMwRFV5aTNSK1J2QVYvb3hieU5PMWh6OGo5YzY5Rkd6eHV0?=
 =?utf-8?B?azJtd1NMK3Q5a2xBaVVxQ05lSjJGT1h2Z0xHbzRWN2xqSEJmVGkvT1N1Tksr?=
 =?utf-8?B?eEwrTzlQeGZLZlBOY3d2dXRTZXRYK0ZmTWhibmpnSExlVWUxMVQ5UVhYZkgz?=
 =?utf-8?B?Ty9WcDJJSmdLU3RuN2pRanUxeGFSaXNxN0theFJHUmpZd1M4SkVzbGR3K1Iw?=
 =?utf-8?B?MldJWDNoTGpTOXBQSHYvYWQ2MU5GYkpzckpzd1YvNU8xU0kvM055T0IwVkRN?=
 =?utf-8?B?ejYvSzMwL1YvT00zRVhGcHlYMTU3VTU3MWNtcnQwUUlRc1l1OXRMTFpxYUh0?=
 =?utf-8?B?UmlHMGVvaVpZZitRcE1kRVlNbGlDTDlncWdGa3JjWjN4Yzd6ekQzRGU4WUhl?=
 =?utf-8?B?TXhZa2xUeXIwdWFacy9EcXJQbnJHUHdUbnh6eVBCVXJhbldqZGliQU1PcVpz?=
 =?utf-8?B?cDNramExYmM5YyttRFI5dXZqV1daMWZHM3NlMW9jcjgzVTNmblp2Zm1UdHpz?=
 =?utf-8?B?Q2t2OXRzSkliM0JFMENCUVFRUGdNVjFRdC9OSXhVd0pzWFRNMmZaZW5rY2pX?=
 =?utf-8?B?clJsNkxQbDc5YmVHdlFISmZKQkEwZkUzWXJwUzRjMXp6SklnU3dCUEpEbis2?=
 =?utf-8?B?VGcrTjRDVm1CTnF6OTFudVNWZWk2L01DRGs3dDFYVEwwdG0rQUNoeGZZYW13?=
 =?utf-8?B?ZTZWSEpvdy9TUVVZODN1dVoyT3RlMEw1eThjVzR2cnZlb0RxeW0rbk53NENL?=
 =?utf-8?B?d0RYWWVueXJsbjVCWjVRbXIyUEcxSzBDZGJ5cm01WnJBeG1kSVFCbmFQK1hu?=
 =?utf-8?B?YlNQbDhRcXZVQ0daOEFBWHFxTVljbHpub2UzcTB4ajVSV3JWQnZ4VThCWUZO?=
 =?utf-8?Q?vuCM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dk93d0l0V2ZNZDBveTBVWXNWRi9jaWN1MWc2VUtNNDdvbGM4djVRY0lua0ky?=
 =?utf-8?B?S2RFV21ubTh4Y2VKSGdObTVhVEpBL0tkT2FoT1ZEeFd1UEpRdmNOWllRcjUy?=
 =?utf-8?B?WmJqTW1kREhxQWVDY3JVandZTnd0YjFRcWMzQk1FMFczdktvcVBKb2gxUGh0?=
 =?utf-8?B?ZGFPNnNFYmJMaENVV00xL1FUN1kzd054QTk2YzdHbjRrVkFPZWhBQUppajFH?=
 =?utf-8?B?UTZkdTNBREpnNDc2aXM2K3JSRzVDbzdrRkJxNW5WQytEMnRabUc4YnVLQWdx?=
 =?utf-8?B?Tm50VEhVVkZhNzRyOXZMWUswRzRQLzZXVTNROEc1aXVaOWdlVGl1eGNCNlIz?=
 =?utf-8?B?NlpEUEF2MjVBVDlBS1RvMlp3Tk9Xcll0QjRibDNBdzd1dGJWbXdxMW5zNThQ?=
 =?utf-8?B?NFQrU1lGeWgzWVJlQWFsa1h5TStnYmlWUEczRFR6Ynk4aFlUUmtocjBjNUYv?=
 =?utf-8?B?bGw1elVRdHI4U3B1ZDhVdkNZVWJqZ2JZNUd3V0F4ZmJ6c2U4cjd0cGtEUDJ4?=
 =?utf-8?B?WUZPNnA4SVVCTENOSWZrT2Y1Vzk5YmtkZzFFUVFJZnNIcXJKNHRCWEZSc2s1?=
 =?utf-8?B?L0ZQUHhzb3FQQ0JsZUNqTEs1SWV2dmZZYzdIc0g3N0FrSmxmMStybFgzMG5o?=
 =?utf-8?B?bVNFVkZKZ1J3YTBMa0lCR0s1OExYVkttZVNJSGxnMkdQZmF2MWRmOVBuVGht?=
 =?utf-8?B?TXh1bmxzeHl6VkNhZldEejRtUXFEa0xpckNIdnhrOUlNUkpJcXd4RDdKcDdO?=
 =?utf-8?B?Nm1IbEhjNGg4VmFRTFk3NHhUV2ZBYk4zeWk0cEZtMENBdTE1aStCbThCWGYy?=
 =?utf-8?B?Y0JDMmRDY3NhSHluREJIS1ZvQXhZMnYzTTlyVC9GWE5OMTBIcGlFd1J2QWtm?=
 =?utf-8?B?M29OV0RDLy9qZXV4NHdWUXF3NmFKM05kbW80QVlOZXYzL2FWb1BOVk9rK2ZC?=
 =?utf-8?B?UVJSV0tpSEFYbHdVQk1LRUkxME9SakEzZ09tcnhBcjlYUnF1T1lVekIxcm5x?=
 =?utf-8?B?TFFaMTFRZ21PbXlER2dBYWVXaFAydGlpQWZxZFBDekl0Y2ZaaDZ2TjAvYjc1?=
 =?utf-8?B?V215VzhCMmNTY0ViclNsS0ZmbTVjUnhwd0pyOVFjWXZveFlybnJydFNkVTNm?=
 =?utf-8?B?MWZ4bUtvb0lOdWZhUytpdHJ4b3I1MUc1R3BQZFEzVTdISU5aZytiWDRYY005?=
 =?utf-8?B?RnhsSHBpSklmMDdQUTFTNmRacmVmV25uTUQ2S0hvcW5zMzJ0WTRSdnAyMDZa?=
 =?utf-8?B?UFpHMnNqNURXenl2SFMybzFJcnFaSnQ1YlYxbkt0ZU9DYS82RFpDcTFVcVhF?=
 =?utf-8?B?SVh5NWNaelhJMk8vUDNkUjBaL0hJWEZ5MXRLVnRQTm04ajZYQnFwMEdOK1N1?=
 =?utf-8?B?YkhKeldPMkcrQ3hCUXZrWTZkY2habUtCU3dtaWY0NjRvZEJVRHUvTGhPOUN2?=
 =?utf-8?B?a1BFRlZXSGRTTVEvdmxVRUdoVStJU1RTZ0kxOG1PeUZScHhHZ0lqTlJsQ1Yz?=
 =?utf-8?B?OFRFeVRUWG0xUmJwd2g4K0s1RHA5OHdHb2NMeTFsN0JLbDI5bllBZkMxSVRS?=
 =?utf-8?B?WDdyWDlROFc2ZmVjZ1Q3aVQzcGRyQm10SzM4a3BRNDJXNTRXeGdVVlIzaVpj?=
 =?utf-8?B?c1JqY1Q1Vm9sbmgwcHliVDRqVXA2U3NGUm9ZNGE0aDdiRHJzM3U2RGU4cVBQ?=
 =?utf-8?B?VzVZeldOV281WXl2T3NkYndyaitLZ050YzhBWS85cTFnQi84TEMrRHVJYlFR?=
 =?utf-8?B?WUZBZnUzcWRibkdmY240TjVPRGV1NGMzK0J0VmNnNDVHWHp6cDdRTHZyMC9U?=
 =?utf-8?B?UWJwV0lXeHo4NUtGNjBUa01hamFSRzFlaXJERjJ3UlJYYWowQzZuUGFqVHdN?=
 =?utf-8?B?NUFDZDJsVkNmYUUxNjZsN0FTcUg4c2FmRWhiN0dZV1RUdmVOK0xxRzYvNENa?=
 =?utf-8?B?K1NRSjNQbmhJRDBpcG16WXo4WnRXRXF0ODY2elBOaGtzUHhOc1Z6eS9HSWVl?=
 =?utf-8?B?MCtHYkdTTHhRTkZ5ajIzaEI2VGJHaUp2TnFDeXlEWDZEVnFPWVRKNTBQTkxM?=
 =?utf-8?B?bko2aGhWSm1UZUUwSW5uK0pndnl6K1FWaWhlOHp5Z3RsUGZsS0g0U1dvaGZB?=
 =?utf-8?B?TVZyOStLRXpOdi8wMlg4TzVwa2JINzJHQ21McE5YUkFkZkhHbUUweFJkdFM0?=
 =?utf-8?B?Ni9nWkNmU0w3S25aVGZmdnFVSjhuRFJuaFcyMEd3bUlYdjR0d01LZUQ5RGli?=
 =?utf-8?B?eUFZaXN0SHVRSDUrSlpQdjZyaE1sS0xEanladUFaWWZ1cWNxcGpCSGRZSnRR?=
 =?utf-8?B?QWYwMmRyN3Uxd2Ewd1lpVnJrRGpVWFZtK1pjNkpxTHc4MnU1eFRPUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db2abcd-3207-48ad-1db7-08de541ec7b9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:13:51.1613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErQlLM+hjSpRhZ4LS/5wuRQ3Buv+s08em6GTaynX2Brnw4A0PxPO7qd3CnxowqukiW1nLn/pkl/MZ3KUJdmkdqP4+TPx4j9gkdH/Jrem2NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9079
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Jan 2026 10:14:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8568

Hi Antonin,

On 12/24/25 5:24 PM, Antonin Godard via lists.yoctoproject.org wrote:
> After the Poky repository obsolescence, refresh the build directory
> definition. Fix the formatting and indenting issues while at it.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/terms.rst | 46 +++++++++++++++++++++-----------------
>   1 file changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index 6a9f88061..4b9b6ed88 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -63,36 +63,39 @@ universal, the list includes them just in case:
>         This term refers to the area used by the OpenEmbedded build system for
>         builds. The area is created when you ``source`` the setup environment
>         script that is found in the Source Directory
> -      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```). The
> +      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```, or
> +      ``init-build-env`` when using :doc:`bitbake-setup
> +      <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`). The
>         :term:`TOPDIR` variable points to the :term:`Build Directory`.
>   
> -      You have a lot of flexibility when creating the :term:`Build Directory`.
> +      When setting up the build manually (see :doc:`/dev-manual/poky-manual-setup`),
> +      you have a lot of flexibility when creating the :term:`Build Directory`.
>         Here are some examples that show how to create the directory.  The
> -      examples assume your :term:`Source Directory` is named ``poky``:
> +      examples assume your :term:`Source Directory` is named ``project``:
>   
> -         -  Create the :term:`Build Directory` inside your Source Directory and let
> -            the name of the :term:`Build Directory` default to ``build``:
> +      -  Create the :term:`Build Directory` inside your Source Directory and let
> +         the name of the :term:`Build Directory` default to ``build``:
>   
> -            .. code-block:: shell
> +         .. code-block:: console
>   
> -               $ cd poky
> -               $ source oe-init-build-env
> +            $ cd project
> +            $ source layers/openembedded-core/oe-init-build-env
>   
> -         -  Create the :term:`Build Directory` inside your home directory and
> -            specifically name it ``test-builds``:
> +      -  Create the :term:`Build Directory` inside your home directory and

I would either end each item (except the last) in the list with "or" or 
start each item (except the first) with "or, " so it's clear you only 
need to follow one or the other.

> +         specifically name it ``test-builds``:
>   
> -            .. code-block:: shell
> +         .. code-block:: console
>   
> -               $ source poky/oe-init-build-env test-builds
> +            $ source project/layers/openembedded-core/oe-init-build-env test-builds
>   

How is that creating the build directory within my home directory?

Looks ok to me otherwise.

Cheers,
Quentin

