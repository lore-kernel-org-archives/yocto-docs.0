Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3393C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:34:17 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.web10.7164.1748943256699960135
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 02:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ejz0G6Bh;
 spf=pass (domain: cherry.de, ip: 40.107.159.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbXsSZENU6B/MtKkyj/23W9C/lvpu3VD16D+DzWkhzFkcA5RXk/mCIoM9tcPRazO3g5nkps3z2+rWvAK1L82j21oT25nD3WPnSXswDJvXib1F3DaqBI/WqSw5qJqmyrrCfpbquEw0Q/7SY3LGWB6TWo69x8XBtKyWmpg6XAQvhVFL2VjsoDdEgiONH5fqdQnD0x72KD/azuVbAVWGaS6In0gA1y07oaDT4u8vt6zVeJ2qOVxM8WtrRHYX45FcGPgrMbGyA9Pd9Kwdf3T4eqN1KKMPNg33lUdh5dyPFqTGqJ/QKkPDKv14hI+y1uWG92Vw6DqU89bIMlPpg38kxjhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rk0384AHIxd018lxzHHIWXyN/Xc3FYug1K6wLBWwKjk=;
 b=OnoJsgxP9a8PxtMhFX1Jn4FE/BNzLI5vQDXUF4VHL9a6tINaP9JLQOn929vqQQ2xCQO1pABy6ALaKiyV7r/S0c1TxwhSG1YHHW5+h8mquZPfi3AZLhlF7zx/sTlKtYWEu9IDlT9+8ZJ4fUBlgYmhNU7nfbMUYCATcSoflRan35QnWKMrks1sLBFvTdo4jArKkpK1Elem5DnrxNFRArQb+9hbBDrX+/pfaNa1eDLoEz7m3wClOgBxAM9FwwsjjIHCfXEnNXrdNIBzBJirfYh1xSqi5KGpqIlXA2TaAjvNYjyYtYSYSCekqhbme5atWnxMhjaFyjJLsLVaeCXjedSNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rk0384AHIxd018lxzHHIWXyN/Xc3FYug1K6wLBWwKjk=;
 b=Ejz0G6BheIR3k3qId3elX3ukepwvI+NQgnOAM9CGfKBa3ooYsu0KinzQNZ5uMUrrCa2gBQv6dXNuMH5nOdxeMplUqpLv3EdOWBWy6VSPyDqkT4rwcW+FbgG/Eu46it2oGFwXEC0khnGmAjCrLSrHcxI1u+OA7MUCopNoh9F360k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 09:34:13 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 09:34:12 +0000
Message-ID: <3b7f80ec-9a9c-4eee-94bb-bec3a16041e7@cherry.de>
Date: Tue, 3 Jun 2025 11:34:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] YP ref manual variable glossary: should entries link to
 themselves?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <4a204afe-d1d7-eb97-8c57-6eee390e8afa@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <4a204afe-d1d7-eb97-8c57-6eee390e8afa@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AM6P195CA0067.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::44) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: d61fe885-111b-4b1e-4f1c-08dda281ccc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3JLc28veDUwK2tYNEhOQUtoY3RZeWp2NkNHc0N4TFQ0N0Z3ME9xSWRkQU9G?=
 =?utf-8?B?OHdxcHFjNXdqb2JMaEVPcGkxejVmR05oVDlqWGhFQ0ZORUMwYkVwQm4vdndY?=
 =?utf-8?B?N0x3K2tEUG5rNUxNYkg2UDlwckMrbDFJUG9sUzlwSkl4YkdpZ2ZyOHp2Y3Ew?=
 =?utf-8?B?eHBwbXp3SGV6VHVzWDNxc0pqMFpmMVExM3hRd0VINW8ybGc5NzZWRmt1Mndo?=
 =?utf-8?B?VjlvYVM4Rm9nSklFVml2azNQL0VOeTJhME5sdHRDa1RadFFlOFRUcHVFUFJt?=
 =?utf-8?B?MzRuT3ZYNzBybFZuaXVnMTgvcGNHTkora3RIcTNQaExKZU9TL0h1TGJZT05j?=
 =?utf-8?B?bDFaNlBPY0swTHNYQlVYMCtQWUEzR1FZTjBRNVMvbFdmSXhaWWZqNUI2Z3Jv?=
 =?utf-8?B?akxZcTI1Vy9tbml3aFpiemJMbGVSRDNEdW1rVmx1M1Q1YjB4ODgrczNBbXVJ?=
 =?utf-8?B?Y3pMWG43RVFMWVVGMTFLVUYvRTgrdjVmWmpUU2UvNDNVa1d2RDZuRVpHWXI4?=
 =?utf-8?B?elRHeWJ3UHRUeURmNXhPMkJ2M2UxQ0xzeFFNK2xYRngrN2cva0dOZjFNL2FO?=
 =?utf-8?B?OXU4cHdid05BQXNCMEMvZU9Ra3JaekVqUlpyTmZ5ZVhRR2tuUVhhS1AzOVlJ?=
 =?utf-8?B?OTBkby9OLzVGdFZlWjVsYlBYVWVaSWF0WmpnOElsOGFrd3I0Zi9XdGZuZWpR?=
 =?utf-8?B?QUU0SWw1RlFpU1lVVnRQREFtMUkvZkVZUURKRVdEeVlzcDByV2ticVphVDM3?=
 =?utf-8?B?Mk5VangrU3ZHbGllVnB0MHc1WTRyRVo0bG5tRzlJZ0pkU2Q3OGp6UXI1WEhG?=
 =?utf-8?B?d3FCcGlqM0cyR2x5Q294UFowbGhSRXlXS0tXWFBVSTNoMHdUT25vbXBPcjRW?=
 =?utf-8?B?b0tTM2N4eEZLeWx5K3ZwWTBnNmlwcHNKcTNIeXgzc1dGZFI3Z05vL3JPS0F6?=
 =?utf-8?B?UFh0WVFSTHNOOWZpNnEvNkhaaVh3R1M1Nnh2YzNmUDVxMkIzTytNUE5mSTdM?=
 =?utf-8?B?MXpuL2tScGtlemtucHFzU2NIa010TEs1UCtmZkFIeG5mVW5WUERZMFBMNnBO?=
 =?utf-8?B?ZkxxL25LdGV0STJkcUZwQmhXV3RlVmxTTjVSVW9xQTNmSnpSKy9kcEVnOGRT?=
 =?utf-8?B?dHpPSTdsK2RTNDBEZHpaMGJtTkZkM0ozTWppSkRCbURHdy83V1o4bjdjU1pS?=
 =?utf-8?B?Qkc2WE5uSEtSelJYUVVLcTg3WUtVckp5a1Q0VllKY2t5REZ3SGlFeHB4M3ds?=
 =?utf-8?B?bTNVY05pdDdLVWRYQU5ON1YrRXV2NldOZFpRWnk4WlJidmVEaG5aQlRRNVBw?=
 =?utf-8?B?RklFV2k5aHBvZXJoWHZpaHVYdnFQUmZ2TU9lRHE2L3d6K042b0VhTFpYVzJU?=
 =?utf-8?B?ME53ZmorU2lmR2QyYWJWSU5HdE14dTA2RVhDbkZnM01kaHk5dlRIKytXUW1R?=
 =?utf-8?B?R1dtaWtaQVhaUkxleUI3MFRXYUhQb3pDdEtSWFJQemh3eFpOOFRoTEkyM0lr?=
 =?utf-8?B?dzRHblFuVUV6bTliY0NwU3VqS2VqS1J0N01paHNha0w3MHlZQUpKbHlIblp0?=
 =?utf-8?B?clNDbC9Bd0NINEY1bGZLWGJ6TjdTbmROeGl5K3dBaEFzclpXNW8rOHFYa1Nk?=
 =?utf-8?B?RHRkTXVJUmsrVC9uSnMrV3BaUFcyVTkrREYwRHN2YVpQcjJ4S3BTNWNmTHpD?=
 =?utf-8?B?ODRsWUllNmpEaUh5bENXcnBwbGdGY084VzRGRkZJdHorR1JDdlM4NnZIOTJ6?=
 =?utf-8?B?VFVCY1Rqd2o4QmFPZkt6c1I0MHU5TWFqMkYzekFvQXVnNUZwUmw2c2owbWVX?=
 =?utf-8?Q?32NnNvg9ZxGF+4iKR2BA0h32DdSmAy1kKj0sE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3B6bWdXRGp6S0xLMmNIQzd3NHhjWTJxWk83VEpVZnc2UUhkTmlmQThMekpS?=
 =?utf-8?B?cGFwV3FoOXlVbkNBdVNHM2Z4eHM0b0tYaThtcElMemFSR3crZlhISnF2QmtN?=
 =?utf-8?B?RERDa0xpcUs3SDArSTRuYWR1c2NQcVFoS0t5YmVnZVlDVHJXeUhrV1M2Ri9X?=
 =?utf-8?B?MHFzZ1RQWjZPaFNkaVB5OGk3ZmhUSThyRVRrR1JJTW5iY2hKOFJPUGozeEZC?=
 =?utf-8?B?Y1hmUG44dVpLQitaTUZWVGd6dUdGTXFVMUZESURYWGRITTZEOHZ2eGxNbmhI?=
 =?utf-8?B?U2g1VjZnaXlJcDNldWNqWXp1bGU3bUdSR2YvSFQ3NkdYaDA2KzJDTHhPV2Ew?=
 =?utf-8?B?SmNNcS83TktJWjk1T0ZTYUl2dmlCK0hqcHhvcXduVzAwUkh0OHU2WFJ0ZWZv?=
 =?utf-8?B?VzY4bzdhVGVZUDRQN1BZWVNoUnRDNVhSU1hTbk1IelpOS3J6VldyMjRjbjdP?=
 =?utf-8?B?ME92T295d0VkeDlXR0hzWjVHUmZpUnBZTlFQZG1KR2tWUGFHNzNObHg0ODJ2?=
 =?utf-8?B?WThSTFRySXNEQUVlTkswcGpzeUhZQXdFbDRzd1A0MFB3Mkg2RHB4OUJjM0oy?=
 =?utf-8?B?M0hTc2x4cVdCWEhLemZVMVlaQTFPckp2VnpJRFpIV3VueVg1RnN1VDRMUEMx?=
 =?utf-8?B?NHh6bmlqZUljSm5SMHV2cXpCVXpYU0xUSmIzVUNLclIrQ0l1NU5ZbFRwbkM3?=
 =?utf-8?B?UXh5THhReE9ma2RldHZhN1IxanhtK1hEeFJ5NDVtSHVPNUNkYk80YlFIZXk2?=
 =?utf-8?B?bTV5YWFiVXl5V0tiOXdNVEFpR2JYa1krVjMzVHgraHVwSllacUtTSHExbktj?=
 =?utf-8?B?TTRkQnZqaEkyUUtTQzVjdXA1YjVkN0FLME9OeWpxSUVOam9ybC9pbzN4b1NJ?=
 =?utf-8?B?c2xSY21xN3NDRGRqWU5kUEJ5TCtoWGRrYTIzbHdzeXdEVXBxb0lsOUczci9W?=
 =?utf-8?B?djVQSTJ5Zm5vUUs1ZWsxV2Q4aC9IeGxwRkVhbElLNUMzdmtjV29yT0dLaEZC?=
 =?utf-8?B?M2RGUUJ4YWFiUjAyQTBqbS9yWjYvbVdUWFlwcDdwREg5am9lZloxclJDYVdM?=
 =?utf-8?B?S0prSENQbUgvRnF2c09KcjQybnE2eWdXTThGdThuY3hpRTI2eW9ySStvYnRX?=
 =?utf-8?B?ZVhqYkdObzZXLy91SFNEWndncjVFc00vd0U4MDArcy9PMzdDeVFxdmZuZnp3?=
 =?utf-8?B?em5xeGFjN0kzdzlPWUcrYVl2QURhamEyTUNRQlRRa1cralVuN1U2aTZqOWo1?=
 =?utf-8?B?NlJWVWF6clBYMGtoTDVyWG1vWnYvVkJlUVB4OVdHSHJzRTVGOUxmdlRvREhh?=
 =?utf-8?B?eCtpSmtIbnMvczQxRHYvM0l4QWdMMnFXZXhndGtscjFULzZYcldSMEZ6NXdt?=
 =?utf-8?B?K0dKeTNKZzdtS2NaalpHM21Cb0VILzg3NWJvaFo2NFBSTUhXcmpQeHlMZkx1?=
 =?utf-8?B?OCtlMXluZ3BwRjNGNkI4S2krL3J6NnB5Q0tVdmh1c3IrMEVkS2F0b1dWTnd2?=
 =?utf-8?B?Q2Ftc0UyY250Z2ZkdGliNDU2QTMrczFqYkNVN1FwZXhSc1ZQTWxkUXJ1NlYv?=
 =?utf-8?B?em14b3lQaHYxUnpmcGw3RVhZYTBKc0Vzd1lsdTJNakJuTCt2amIxTzdlbHha?=
 =?utf-8?B?TXNWeUd5aDlNNlRPK1RRWWxXL0xnVUo3bnRxejhTdDVSdjQ1ZjUzVmhkc1Bk?=
 =?utf-8?B?Yjg5TnpobGYwbnVvQkh1Yk1JYnZkSkJVK0VzNUtydjFOTGZzR253MzhRcWxl?=
 =?utf-8?B?bVlXYnNIdDRyNWtiNjRtRXM5a2QwWks0aEZRZHNVa2crcEdCZEp3c0huOHNi?=
 =?utf-8?B?VWZ6ZUoyOXVMRUhuVkNJVVpnNkdZSXBPa3dhNE5xRWNyRU1OR2tOUE1GaEpi?=
 =?utf-8?B?ZllqSktrR0R5NlVzU3BFa0doTnEyb0ViRHNSOWRaM0I4U3J4R1RPV25hQzZ4?=
 =?utf-8?B?V1NYc0R5SUNDSmVLWVkxWWtPNkZjQzArbnN1b1QwczRPNzgwdnR5ZHpiSEUv?=
 =?utf-8?B?Zk9pV3VDdEw4bSt6ZC9tRXRZTGJtVXdpWG9IRzZPc0dhOVZOSzZvNFh5K0V5?=
 =?utf-8?B?OWt5NCt5cDlTSGR4K0xzS1lyNDJvdWM2aUlqd1drT3ZBYzZHUWtmbFRvenFJ?=
 =?utf-8?B?aG9JNGxIWUF1b2hlOW9rN1NSSG81ZWprL1RtaHF0b0xiZmhwYzJEMGVaMi83?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d61fe885-111b-4b1e-4f1c-08dda281ccc1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:34:12.7975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0+CxnSGBnrXXcImvo15QKS53jzFPrWm0F+1Mn8NUeNJiAtu4N0lm/u2+AgwNZEfg1/QKAKm7YAir/9Mhhm1FtEBb7kGXlV+92zo4JDRl2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Jun 2025 09:34:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6984

Hi Robert,

On 6/3/25 10:05 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    wildly nitpicky here but in the YP variable glossary:
> 
> https://docs.yoctoproject.org/ref-manual/variables.html#
> 
> it seems weird when a glossary entry has a link to itself. example:
> ALTERNATIVE_LINK_NAME:
> 
> https://docs.yoctoproject.org/ref-manual/variables.html#term-ALTERNATIVE_LINK_NAME
> 
> whose description contains a self-referential link. doesn't hurt, of
> course, but it kind of fakes someone out if they see a link and think,
> "hey, i'll follow that link to get more explanation," and they end up
> right where they are.
> 

It's odd but I personally like it this way. For two reasons:

- consistency, every BitBake variable that still exists today should 
have a reference. This makes reviewing easier: "is this a BitBake 
variable that is documented? then use a link for each occurrence of it" 
and "mmm this isn't a link, does the variable exist? Is it documented 
yet? if not, then we should document it"

- renames of variables are "enforced" by Sphinx as non-existing terms 
are (should at least, haven't checked in a while) failing the build. So 
if you do a partial rename, it'll complain about it and we'll know early 
enough to catch it :)

The description for each entry in the glossary aren't typically that 
long so I hope the reader doesn't forget the variable name they are 
reading the description for :)

>    anyway, i have some extended thoughts on variable documentation and
> bitbake/YP manual cross-linking coming.
> 

Looking forward to reading them :)

Cheers,
Quentin

