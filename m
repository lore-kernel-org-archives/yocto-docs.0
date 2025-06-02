Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6A0C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 10:31:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web10.46541.1748860310290677765
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 03:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GQ6zo6+v;
 spf=pass (domain: cherry.de, ip: 40.107.20.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/Jn15TFlDnqet0dN0sKva6hVEne2IWs4K2rR/OdW3Tdv+4H1kzgv61Ca4holMFKbgZI3cj9V64lud2wzWTLVMly+pxfiKPQagEX4zS13y4wI4GZwl9fNLQZguJ1tO3NEv13wAGboEaer67Rf1HpOu6viA0AyCxUFtEnIBTSjEVLhbq3Pxw5jBWHWbW1gYKgADXiKE8hXBbTvzTv4/O4nzYYSyiGDPDjS/uGUvbZI28TS2c812W7Ny8nIhZ7c7qWpKaW412Xug/0qcHa63KFGGTd0hVePIgrWKderpd7vMLNkEV/GFoV8f+odkMdq8vr8gd63pgmq8r6XIY2C0DuwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxka+fWX4+0Lpz95FyJEInZw8jyVIhxf5/vTrb+Ze+Q=;
 b=WtXDuVELUZM9M/LTcjqaZwTE3MqzvR5sNYqf2yXP8T79eXnUNYTMsZAYe95AyEa2NJaS3ZY7eUacb8VG5POI1eR8qRTgHa/PTeOryuuOUH87gAoOk+VS/VX/gy+xkrgvunXM88RkL1qUUvcYiV1ntSgZuNQ2gjrGCgZJfWIAeaD1pWZuc9VZMeJxRbH2XLNajGoBkc6uW+sdn83MJc4tbJrDfPOkIC9gX5WoV4W9W2zOJcIHjz2o03jhmTSotNCpVhd8YyXiAJBzNZvyHQJ8k2meLZPzm2xQF/BFenETRAnvQrh0ZuWXX+6xa4+nlHI/+vYMurZK1TjzVH8WwAR0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxka+fWX4+0Lpz95FyJEInZw8jyVIhxf5/vTrb+Ze+Q=;
 b=GQ6zo6+vmqqowXlS4ExLUmt3yEAoNKldH2pZAzlCTM7bZmVNUvYex8ae2h90uv1BKu/wd3oQcF9et3RMEVs0hTA5GT70YA11VNY2+quvhFK72z3mUzqAJ2l/10G1DpGbMqjWEnX1gbQy9oFa51vy3vhpGxJwqdp1KkgwJ41hXAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9570.eurprd04.prod.outlook.com (2603:10a6:102:24d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 10:31:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 10:31:47 +0000
Message-ID: <3e1553ac-af88-41e5-ae1d-68b4b9505d24@cherry.de>
Date: Mon, 2 Jun 2025 12:31:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][scarthgap] brief-yoctoprojectqs/ref-manual:
 Switch to new CDN
To: steve@sakoman.com, docs@lists.yoctoproject.org
References: <cover.1748640673.git.steve@sakoman.com>
 <b24ba407835b0fd7ea70d16fb28d3e69477e46db.1748640673.git.steve@sakoman.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b24ba407835b0fd7ea70d16fb28d3e69477e46db.1748640673.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0350.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::22) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: d57cbcf4-2e32-4e51-03f2-08dda1c0ad47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3o1MnZvSFByaXEwWVlLWTZhL051VWtHQ0xHc2NkanQzNVVEOENaY0s4ZFJD?=
 =?utf-8?B?bU51NGxlMWRCY2gwbUV5aXBFRkcvUE1wUnhLaGdNaWpMcGZaV0FQS0s5WjhP?=
 =?utf-8?B?bHFBdlNJS0NIR0tRTVJqenVFMFhSMm5ZeGEwaFVET3RVNmhZMXpZTXpacTB2?=
 =?utf-8?B?R1hNSi8yQzBqbGRyK3dvdllsVlgyaXRLYTFPdEgvcGVLdzVmNm5rOS9scFVa?=
 =?utf-8?B?c1FzeUk3L3RKY2p3emY2K1dqdmcyenFLcHIxY1ZwOFQ0emdXMGV4M2ZJSVhh?=
 =?utf-8?B?N2FwTWhpMi94Q0djUUU3U0NJVWVEOW9rMWFoQlc0SW5lY2l3RTQ0aHFycDdq?=
 =?utf-8?B?b2ZmaXJENEtlekNhSEk4K2RQWmkybko4Sy8zQi9rakFLN0swNlgvMGNLYlFt?=
 =?utf-8?B?Nng3MTFuaVcrSXVTVkFTanRnS0k3V09aR0lTWmFOelloRzc0QVFlclFSWnlK?=
 =?utf-8?B?VUw5RWxtaG9yekQyc2xoSVVVeU9wRWxkRmZDbmVWQ050djNiNW1obkdyN2R0?=
 =?utf-8?B?YTVwRno0MmdNMHVqeUxMUGpuT2Fpc2lWa2lERzcvSmtjM3BhK0VLL2JDaUtH?=
 =?utf-8?B?Q3ZkeGNJVC9DM0pMMUE5bWJtNW9ualVSZmVMWHhOWWRYNlNYL1BxU3dvYUlO?=
 =?utf-8?B?TFVJWHl2Y3pZNFAzMjJpWEovL1FSWjVCdmtqcDVsRVowMHhBRU5lc2VHMVJk?=
 =?utf-8?B?U0JIeG9TcnIyR3B2b0dKZVBXamFMZjVVVm1yLzU0TkRPeDlUa3Q1UDZDeFJJ?=
 =?utf-8?B?NzhFT29CZDFSb1U4V0lkdDhMOHluMUExT0RyUlVDYmxuSCsrdkF5ZnRIOWlG?=
 =?utf-8?B?UUdrWU03ZENKTkRzd3VhR1pIODRFL1lncnhLN2ZQTVd2bmtHeGRTeGZWN0w3?=
 =?utf-8?B?VE9mVFYxNy9iblg3dkdDZC9vdXVOVU1SZ2ZHcWJnTVRWWDFveGwzZXJFUFJF?=
 =?utf-8?B?L3BVRUs3a1JCb3lPWW5zV2lEYU9MNjZQMXpneDlISGNYOCtLdVA2eTN2WUVs?=
 =?utf-8?B?Y2ZESVhpMlR3eVl4TUdob2RhMTNsTEpYa05oV0VZSEZmeE9WSC9PWFNNcSsr?=
 =?utf-8?B?TjVHY1BBM2xOeEFKd2tNWjVoSXBuVEpTc0kzbzdIM2FCWFczOS8zYWtOUy9T?=
 =?utf-8?B?a3BrYWwyZFg0V1dvUjNuZjljb2xnQ1g0WDBqUXNjNlZ2SWQ2ZElxaXVJcXpC?=
 =?utf-8?B?MHloY3FWRmhwN2s0VDQwWGFIeVEvN0lpcU0zS1FpK2QxWXNlMkUzVkVtY0o4?=
 =?utf-8?B?NUFkam9WdzZKSWRIT0hWVnJGcFpjSUFISFZMRFdNWWVwOHIranJxNm5zSndN?=
 =?utf-8?B?aXdMT3ppV0U4dHd4TkFURzZTb21TWnpjVlU0OExWMlcwZEZoNUFTdmdCOXNt?=
 =?utf-8?B?cEJHRk1iWnNrYlVWZkFXK0V0aW83RFZNTnI1MnN2b3U0MjhrR0RCRElnSERV?=
 =?utf-8?B?MmxjUWw2RzNnYXVCZGoxK3NkL0lmNW1ic0NnMGpWY1RQTFM1QXcrak1DQnJi?=
 =?utf-8?B?cHEyYmFGNFNCYnFiWEtPQlNaYnpwS1hQK2MySUp4WTU3cnVJNm5JL1lPV3p6?=
 =?utf-8?B?NDdhOCs0TkV1Uk41eE9LVTh4Tk5qR1BNT1lYSXNDUVZDY2xKa1gveDNDanRU?=
 =?utf-8?B?TDNVS0V5anhKVmR0dlNWK2NzTkg5RHJ0QXNESklXemdsdm5TY2NOUFJTaGVJ?=
 =?utf-8?B?aGdiU2NTZk9YaGpSVHF4UnZXcUd3bGNaT3hkUS9XeGV3THcrMS9vM2RnWDAv?=
 =?utf-8?B?TG1Hb2tZWFZpUHZ0b3dIYWxROEJmZi9GNDIxR1lHOCtlZ0hoYjRsN3djL2s1?=
 =?utf-8?B?ZCtZNVVQUWVsaVV4VmRhYUtIWnFyck5zQnh0dVVkUHJrYWZRblNyZE0wOSty?=
 =?utf-8?B?U1dQUnJZZFRkYVVnalJrNXNRWlM0MXRMM1NOMUZ4c3ZMY2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHN6RzgzTHNhQThMMzk0cVR6WGNBQitWK0JUUkh0a2JvNEIyVXVuZXBmOUdW?=
 =?utf-8?B?RjNaVjArNkhzT3BkMWVkZjU4WWNWRnVBc0sxdnNqcVQxLzN6c2RKWG5aL2pZ?=
 =?utf-8?B?MXdINlpOajFKeVFnalRWK2JFOWlydGp2OEZsRDVGTGdkSStrVHk4dTlxV0JL?=
 =?utf-8?B?WXNDQXdjUmtZSWVjQy96K2FRWVZORndhZGRsci9vb0RPVzFlVi9HMFB1YzdS?=
 =?utf-8?B?V1Z6cytaR2NkcHphQ2xjMXNFTGJmRmFmRHkrWUFXUDJNeEFGVmlTUFhSQzI4?=
 =?utf-8?B?ekxVS0x1eVhQQWpKMWRzOU9xeXJpcVIxcFdnV1Zvc3AxaE1ucDNTVDdaUnZK?=
 =?utf-8?B?SmRwNGlsUFlJNW1PemRXeU80dE9STEhYUnNVQ1ZseTd4cGJYQ3BOdnVwbWpO?=
 =?utf-8?B?b0JEcmpuUjJ6YllZMEdjUWhSK3JHQXQ4TE9OYUlobWtUekZtTytBNjRkUHk1?=
 =?utf-8?B?UXU4NEJUTUhjTHJMNEd5SXhINDlOdGp0V01LeEtrRUxYYjJIdmMxME1hOUZL?=
 =?utf-8?B?YUJmbEdMWmtMSG81MkhYcVd2SW95dGErTGpRMHFiT1FoR2xmbXNPVXlWdUlN?=
 =?utf-8?B?UytHV0psdHY4MUZ1dnU1TFBWbnUrYzc4YUV4d2d4Y2VMazVkNnJNTndrbmdq?=
 =?utf-8?B?dWtGMmVobWEvY2JvN0NNcm5tMDF4L3BWZHhOUW1DRXlMTll3Mjg4OFo3cWFV?=
 =?utf-8?B?Q3FZcTVvUTE1eWZhRUp3RWRqWnBVb1E3eUVKWFAxeFZNcEV3WmVGL0VOM0F2?=
 =?utf-8?B?bndxbTc2Qmo0aVk0bjNvRGtVRjJrM0Y5b2c1VTloV1NHL1dXblV1UHY3V1Er?=
 =?utf-8?B?VkRkbnVJa2UySDB6REVhRldCZTNTMDJxRlZIcXhPWmhia2JJbmRaTUo2b1I1?=
 =?utf-8?B?R1ZyMTNlQ1Q5VUczdjJxUUhmUEpXVUZNNzBQbTRQOXdRRVJBWEFuSkx3VFBu?=
 =?utf-8?B?OEVmMlo2b1lWSGJiUmFCUnFSTjEwNzRKbDRKcExkTHlpNTVpV1MwWWwwdlpE?=
 =?utf-8?B?c2g4MnRaaWZOaVZ5VG10NHVPdnJkMlBFQXFBL2J4Qm5iNGl4Q1JOYVFXSUJw?=
 =?utf-8?B?aTVZVGhQaFMxdmtIVVlFNFozc2ZuRmk3Tjh3Z0ZDbjl0TkYvUGdSSXRRVkVm?=
 =?utf-8?B?OE1nL1BMazZ4RHpvYzNTdWZjZ0laU1o4bEpoRU9lMG5lblRFTTJlWmRXZlYv?=
 =?utf-8?B?Z2NpYWdjSTRiZ21XellxSFd0LzFTaWlUSWFqc1AzM05oSkpCZWNlYkpLVURM?=
 =?utf-8?B?eFFCL29iZkZySkdJSmhZUC9iMWFYd0M5YW1yYkxVNzhqTHIrQjhKNit3WjNX?=
 =?utf-8?B?Wk1GaitlRUFvM1gxTnkrNXl1ai9PSVFYWjZwNXNSRXN5MitvWklUUWlBSm4r?=
 =?utf-8?B?aTFQU3QwSjF2d0V3ekllVUc4cmwwRHAxZTVwY3ZIbkoySEU1a1hNek90WFda?=
 =?utf-8?B?eXQrN0tNVFdNYVdMRVBZcTJHSTIraW1jSFUveWhrTXJtN24zWnFDaG00K2s2?=
 =?utf-8?B?KzFIWXAwQU5WNVNFZTB0alBHZ2xrREsyOXZBZjNJWTM0cjhKY1pHZzI0aGxt?=
 =?utf-8?B?bVAvVXRxYUlZTU40MVJDVVJQSjIyYmd1RzlpT29VOFc3SncwR0hwRkVnaDcw?=
 =?utf-8?B?RDB5UnhIb0ZRVEVnQ0xRV0JFdk5wdm41dkZPWkFhWDdwUURheFJtZVdkWGl3?=
 =?utf-8?B?RWVpZytsTWxENUEyRXdlMDBlNTdOYVpUcVRyTVdYOVg2dWgvYzBnS0xFL2FD?=
 =?utf-8?B?eFRXa3lGUXpKVzloVnlpdmpzM2dVTTdHd3h6UlFQdVVPTExxakZPMDFUYTBq?=
 =?utf-8?B?QUJCRkpkNHRzWFFMdTZjdFkyc0w0WmhlakY2UkYvajJqLzQ2ajU3eFJ6N3Fs?=
 =?utf-8?B?SGZkLzJBdU5sZ2VtY2l0SmRQcGxLZGl0VnNBR3d5YnBqQTA1cFY2V1NLaFBY?=
 =?utf-8?B?c21yelR5TjlJS2szMDhXdXhhOHJVLzFkK3V6ZFJWSzB4VjVIT2hJMVIzSGZZ?=
 =?utf-8?B?TmFNUmZRMmowY2hwclY0MDhIOWxCVzl0TUNkcmYxT0tLT1dnd3hocWs1UnBZ?=
 =?utf-8?B?RTBSV3JwbFkvN1pSMi9iQmtnMEFyUUR3bUlneldHVFRGNlFZV3dxTHdOUjNk?=
 =?utf-8?B?VTBqOUIyZ0ZUNGZ0dUszWVNGM3pLTFhPNVhtS0lSMHJRcGNyeFVPQVhZOG52?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d57cbcf4-2e32-4e51-03f2-08dda1c0ad47
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 10:31:47.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZt7Qk7M3LUQvw/MmQ+W+wJipwRenqk0kiWBKlPNyUyFQkSteRwo1DGgfXH6m40a4ONtK2QuAU67XOfrHsoUIEu8lY/dbx9w9dKfAT/8SZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9570
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 10:31:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6965

Hi Steve,

On 5/30/25 11:32 PM, Steve Sakoman via lists.yoctoproject.org wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> The project is switching the way handle our CDN provision of sstate objects,
> update the URL accordingly.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 406e8a8e30404c0538f5aa46f211540bae2b206b)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

