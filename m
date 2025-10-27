Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D1ACCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 09:39:13 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.54])
 by mx.groups.io with SMTP id smtpd.web11.27964.1761557944472461331
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 02:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EHNGvog9;
 spf=pass (domain: cherry.de, ip: 40.107.159.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOr4psnU0noSUBYjbWtrq4SWpPSAcgyPT18wbKUXmqlhI6ZoDPKyTstRleFwDPhB+//LEAFLjYHACW1qjeNC6uM8Vxlgzrg80yFCbJxQI144Yb8shP/ftXAHGoZc6wavKLimLhqlELL0AJulZBHKiCb10CapzuDfoiRQPfLwOH0sdnWXH/7dFnxojrd5nTVGJelwW6SXAvsUl/ALP3NMPFOmpl9zFyxxl8+ZpVJFcU26iErU2uYgWzkGnkjYAPCXmPHDkYe02Esu3zd0NlCpLkdYnYBi5Tcxa+igM66nRtEddJaUSvBgD/n+0RHFdfRce9ugjTgiGEcYyLQnjcP7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ0e/wRaTTy5C+oRSQ10iGJjeHsRR439JhhnbVR0Y4o=;
 b=y/ih9fZ0ZWydnBC2BAdH/FroS2mawJuFh4BPJYdSD7m/uQUevos5sW/T6h7Qa8VXuesoc3mJUqNQsTEPaR+TvKpY3QjakfIwT/raOjjcyh34dLMLKCbhxCReVhMm0sKuzrSJPOwPi6aQ19kDhc1b+bXslzv2u43O/SwWvE8fcSx1Nr3NsFt6biWn/dll/KqOFkNtBqYPkSsxgUgU1UJ7NixJP2MUzphQRnOXaec+qKH9TNv3XI7cWMfxTTRoxZuKXTaMDanj5B+QhGPito5hqO+3D2dOqsgOGW/kEJovQlIhbg3xsyf3w4DKM7MVfQHWiQki9q8iV1NkcnKWLHa5OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJ0e/wRaTTy5C+oRSQ10iGJjeHsRR439JhhnbVR0Y4o=;
 b=EHNGvog97GOtX/8iUd8q52KbNTLvsRp1BuxZD7tJqCXdFQh52Y0MIEB5LTPqJBILfTRQSfNNkM1clnHwRnQK9Cj2k85Q+de5U30q76hYEHObaoFZkwVIrpEdkpoJh6jLVXea099nnlCFHoLW/hOaw+uFcZUPwpaH9LYNvI7P530=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7567.eurprd04.prod.outlook.com (2603:10a6:102:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 09:38:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 09:38:59 +0000
Message-ID: <5fbc6959-fad5-4889-bb5a-ca3e308bc6ee@cherry.de>
Date: Mon, 27 Oct 2025 10:38:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] can you apply back quotes to something already tagged with
 ":ref:"??
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <03001043-f0eb-c151-d69f-ffe409969902@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <03001043-f0eb-c151-d69f-ffe409969902@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3f6ef1-cf72-499b-05db-08de153ca7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SWQ5a2orMmR0MVdUaVpkWmtVSHhzMnBsbndrSzA1T1h3bFJreGt4MUtZWWFK?=
 =?utf-8?B?RmIvL3l3WnRFWllneEtIcjRlSUlZRzQvZXJTWVJVeWFEQTFvZFZjU2VaKzI4?=
 =?utf-8?B?L3p6S1pPK2VPQnM2U1c5aCt3WWZydGprY1BIOHVjN21JZE1ZSzU1QTBlNGFW?=
 =?utf-8?B?akUybkI4a1NmTWdPbHUxSVVibzlWZ2toVXdJSU0xRUVuTkhLZFV2ZHNEb0pU?=
 =?utf-8?B?K3FrWWlGMzlzblk3azJLanQyaFVOUjYrbXcvNHk2QXdLQVlKYmkwbTRWZW4r?=
 =?utf-8?B?QmkwZWNEeVRpazZnRFZhcWJGbWdha3Q3bmZoYWtyampCaGtBRHhDWXg0OTVa?=
 =?utf-8?B?WGhGclZrMTVCZHVyclc1dzh3K2JZQmFrQWpvbWp2NnlKaXlBQjJRUUxvc0s1?=
 =?utf-8?B?TlRJemRHZWdRQjk2Z2dUVTd3eGI1Y0Y1dytIVEM4djFnQ21OQjNpdjlGc3c3?=
 =?utf-8?B?VU1QYWtiMmlubWpMQUZNK0FWNzhoUG96bUxFWUZTcmlmUGtsNlI3MTNCQklQ?=
 =?utf-8?B?YmlJV2tweTJ6ekZiNzYraklxdzRIMktIckk5MXp0MUd6YjBlb0M4RnByY1lE?=
 =?utf-8?B?YVh2TDJBNndNZG9DZ0JYV2pYR0RlRW0yNVVMdnJNenQybU1JUVIweGY4NVd2?=
 =?utf-8?B?NjI0dkE3dmVlWVFqTFducWo2NFM1aCt4c2huNjA5YkFTOW5JUUNYWStPUnVB?=
 =?utf-8?B?QmpIL0tpQWd1eUR0aW9DMGN4RlVZVWtDamdJeGpZZ25QbE1ITDRaOEI4Q2tt?=
 =?utf-8?B?TWlNeW1yWmZXY0hYVlh4Ukh3WUc1UE11M1BBcUtwUUlXZVVGRWI5RzcreG5L?=
 =?utf-8?B?M0psQVNSWXlSYlRMSnhOT0hlYmV5TWp0KzN4NDBTQXlrc05sdXlQTm9raWpr?=
 =?utf-8?B?RXZXVlV3R1paTGQ5bnp2WnViTGtxaE56Q09DKy9mQ3VXRGJUTTBBU1RKVW9Y?=
 =?utf-8?B?ZzRTZE5FdmRoa1lGdGtvbkhDb1ZTSUlzN21XTjQ3T1hZQWtFSmptTjdYTlFL?=
 =?utf-8?B?UldqZTk4SVcvMjlEb1F2M3VFcnljT0tvNjB0NWRHQ0Z2TlJNSnhDdEN6dWEx?=
 =?utf-8?B?NUY2WFVJa3VuTHIycU40bUFZN1o5VE1CR2hvN0JtZStYbDMwMkhFSzUxZGJE?=
 =?utf-8?B?aHJxRm5TdE8wd0ZIeCt2ZkNFeVpld2gwN3hqTlZTWmc4cUNDZm42RGVWTGtX?=
 =?utf-8?B?bGNadFJnaC9hc0ovU01tNlYzZFNJVGRaNmlqeTBhQ0NDRms0cmFvUXhaZzhD?=
 =?utf-8?B?Njh6RVdxVnNkVlp0MDlaMXZ6M2RsMDQrRUlKcldTWTJvMlVlcjVONU9oZGp2?=
 =?utf-8?B?VllobUxYYlAzbC9oajJteFZCREY2VUlVQWV5SnU3L1lZYlc1YzhLQlhQSHkz?=
 =?utf-8?B?S2pmalVkVlE5K0NLRE1tTmhabTB4NUI5VldMcnl5Z1h2S3ErNEpob3JzUmtq?=
 =?utf-8?B?WnF1K0pVOUlOaWcrb1J6WHR4LzROUlVDdFZMbnhtMmhZNEl4MWZ0dzREQmU0?=
 =?utf-8?B?NXVxVVZwUndBNGZiakZGcURDeEUyWkpTWjRuOFl3RS9mdmVKbm9vOHpOalBR?=
 =?utf-8?B?emJtWXBwbHROWlU4YWc1a05VbHNVRlY1dmczWFF5QU1sUlZkemdJam9MN0tD?=
 =?utf-8?B?NmROV1pDMGdSZ1dzaXZIQUo3bFN1T0ZDeDVzL0JRVXFtNGFBNzJwTUlpTUhF?=
 =?utf-8?B?ZHNscVo2alI3andhQkNHR210bjZYUDF1Q3Q4U2wzcVM0MHJRMWRqTVlubHQ1?=
 =?utf-8?B?dWFmVHlzZFFoTEkyc1JzcmJrNkprSHJLMjRqUElYVjVoWks2aXA2bS85cjBz?=
 =?utf-8?B?enlPM0dPUHhZWVRDSmxFWXhWLzVBbUxtdlEyRVlzTSt2Qmd4SWdLN0xwWEpO?=
 =?utf-8?B?eU9BYXlMcHZiaDBxMHdWa284M0R5Y1MvUWMvOFlTZzdOK2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVVJd3o4Z2E5bDJWREh6UUVFcDhwdTRiNUFmbXkwUHJvTCtFd3ZvK3YxY3o5?=
 =?utf-8?B?NmQwc24xMXIyTlpCU1RkOTQ5cGpRZFZpV2t3YStBcGI0cXdtb1JIK05lMkx1?=
 =?utf-8?B?ZE5GU2pyazV4NW5yOFlLQk45cHMrZnp4Ti9lbnR2dHJ1SEZQMS80NWlmVE0x?=
 =?utf-8?B?QiszaEJ4eXRVaWQwTXplWGJpU3VDcjRzdGw0YUR2cldacjlyMzBQeHM4UVA1?=
 =?utf-8?B?d29CYUpQVG43Y1RvaHVmeTBoQ2tzQVBCdFRHcHh0MWxZZytTQlkzdUZaaDlM?=
 =?utf-8?B?VHE2SmFhaTUrOThPblRjeGJ4VjMxN2FldHFETzN3SWNqVGsvdVlpbXRiajBG?=
 =?utf-8?B?QWlUMnh1MUNLYUFOY2F6TGVtMlcxZ3Rsa3ltQ2RBMUF3T1N4c2wwWkpOWUVw?=
 =?utf-8?B?cWs0ZWg3SkRTT3JtQmpkSHowK3VtK3dZTTBCL2Y1WmR2ZXFwQ2FXTVBUUTZR?=
 =?utf-8?B?MjVmVEVzWXFiL2d3Nkx5N1N2WUZ5QVhJeUU2VU1DK0VFUzFON0NGOEN2ekdM?=
 =?utf-8?B?NmxqM2VxNVZONFdDWGZxTEVXbFl1a3h3M01OcFVJd3pTWmxBVVB3L0JIRENU?=
 =?utf-8?B?ek13MDg4V3VKZ3FCWmc0aGIzdmlKVWI2TkdpSjV6MXhEWVBvRHNFQThheUcw?=
 =?utf-8?B?Q3YyNlVsZ3ZDUDhBQW43VVp1Vzg4K09SaGNTYjBEZE5MdGxDUm9JbTFlZDVQ?=
 =?utf-8?B?Q09WRHg0SUpKdzhIbmZGMWVIMC9pbEhGZHZiaUc0d1FsMFY4bUxVblY1TGVZ?=
 =?utf-8?B?YjNsYlNoLzVZaWlaQk13ZlhYZFJMK1pleTJMbGR2NTNvMTNTT2k2VlNzYnJn?=
 =?utf-8?B?dXRTMmRLVldoZGxZbjhIY1hndXVCcStKYUNpdmxFWXBkd3Y5Zm40cEkyUFNr?=
 =?utf-8?B?ZXEyTzJDWXVmQmhQdnY5allPVW1Hb0VWeVcxK1JIcDBBNHFnTTBNRWJhdURa?=
 =?utf-8?B?TjRUT2ZnN3RnL3dlS3pScmsrUHRGbFcyckV1Z2xTTHVWb2VQeGV5bU5uMk11?=
 =?utf-8?B?RUJ2SVpuSG9jcTBuUnFjWFI0NUErTVlmLzJ1WksvMEh3UUllWm5ZRHNVUmdP?=
 =?utf-8?B?bmQrZFg0elRXNCt1enFkK1VycG43LzNXNFJJTUdDQm1jRHFjMndpaXJaNGwx?=
 =?utf-8?B?SXVzRVlVcVBLWkt4YUw0bjlGLzhPekwvbXpnZE83RlJMSnRqeWFIYW9qN3BR?=
 =?utf-8?B?Umdjb1RBUzNnNEd0MzdESUh5WFdjTzBXTU9TcW5lSndrbVQ3ZWNJR3ZyRmly?=
 =?utf-8?B?OUxpc2l3aXI3K2hNWWVDVHFwQ0llakY1T0FYVUc2R3lXNThjMVU3TlhBSDBJ?=
 =?utf-8?B?M2xFVWlEVGc5R2RZMUtTUmVLMjdZOENvK2dHNEZIQnFTK3NnVWdNa2wvS3FV?=
 =?utf-8?B?RjZCeGsvOEltZDlCYVpWeU5SSUR1RHFsSGc5U3hubmNNRGpYam15eXVqNkUx?=
 =?utf-8?B?dlVaQTAwc1c5N1B6SWI0cVpHL0lQLzUrczdNajhQNmtHcW92U3E3Z0dUTDdi?=
 =?utf-8?B?QTYxL2hJTGxFbDA1U0tSRzdqZ0hGVmc4b3Bsc1BlakNTOEl5dEFoc0VvQm01?=
 =?utf-8?B?TVVUc01sdzB2a1NkUE1mc0phQlFtRmRIUmk0bUlHZWxaRUgweXhFZ2xBSURD?=
 =?utf-8?B?M28ySzN6Smo0TmY0OXpNejIwRVJkY1N0ZmxRUzArUXhCYnNNVG1iUlAxMWZx?=
 =?utf-8?B?Z3dmZXZydkRDNFpQek1uQS9oN09KY0xTQ1dRbmtHcVpDdHFjTVU2bXZzbm5s?=
 =?utf-8?B?c0FZNWNFaDR1OHQxVGZ1MnYyYzFPTUhOMlJWcHZNdlYrVzByMHp5U0hMdnpO?=
 =?utf-8?B?U21aVEd0UkdQQnZ0Nld2SXVhdlNLbXFDUnhFclJId2REcU1SV1VISWJ2cXB6?=
 =?utf-8?B?aGZxbGlUUUFzK0t3WktGRTduRGUvZ0JjbloxLzNjNDYzYXVPNkI0em56aThI?=
 =?utf-8?B?MTF3SEpJbnhOQWdPRkkrMFFSNHUyRndIWTJFcUJYWnhPQm1WZXI5cXpvUWhj?=
 =?utf-8?B?YUhjU3FDdmYwME5ZbnN0emdnR2drSUI0Zm1XcjMzSEpZbXpUTHVyQVJiUlpF?=
 =?utf-8?B?OWlSelpmaWp0dlYxM2l4VFMvRG9WM0llRlVjQy9URFg3TGhtalI1QlFKWGxG?=
 =?utf-8?B?VDlYUDJoTEd3RUdLTTFML0toUExvTDV0dUpZYXdENGR6cEw0SkpDT3pEN1N2?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3f6ef1-cf72-499b-05db-08de153ca7fd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 09:38:59.5835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5mx2ndt1GG5Rbd6BUNqaMBukemfNim1OwVkitqb9/jdvbRcAGy4Rcgr5Y03aKkx0HvcswdzLDHu5LdJGuF8kStXGnFqG6eL9TXg3u/0GU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7567
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 09:39:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7843

Hi Robert,

On 10/25/25 12:07 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    just noticed the following in dev manual, "layers" chapter, where it
> *appears* that someone is trying to render as monospaced the utility
> name 'bitbake-layers' inside that ":ref:"
> 
>     layer-creation tools, see the
>     ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
>     section in the Yocto Project Board Support Package (BSP) Developer's
>     Guide and the ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
>     section further down in this manual.
> 
> Notice the backslash escaping of back quotes that suggest this is an
> attempt to render as monospaced, but that doesn't seem to do that, as
> you can see:
> 
> https://docs.yoctoproject.org/dev-manual/layers.html#creating-your-own-layer
> 
> or is that trying to do something different?
> 

https://docs.yoctoproject.org/bsp-guide/bsp.html#creating-a-new-bsp-layer-using-the-bitbake-layers-script 
(source code 
https://git.yoctoproject.org/yocto-docs/tree/documentation/bsp-guide/bsp.rst#n1145)

Remove the escaping backslashes and try to build:

/yocto-docs/documentation/dev-manual/layers.rst:19: WARNING: undefined 
label: 'bsp-guide/bsp:creating a new bsp layer using the ``bitbake-layers`'

If you remove the tick quotes entirely:
/yocto-docs/documentation/dev-manual/layers.rst:19: WARNING: undefined 
label: 'bsp-guide/bsp:creating a new bsp layer using the bitbake-layers 
script'

The title contains tick quotes and it'll be found by the 
cross-referencer only if we pass the link with the tick quotes. They 
need to be escaped though otherwise they don't work as evidenced above. 
Having it render as the title would be nice but that isn't the reason.

Cheers,
Quentin

