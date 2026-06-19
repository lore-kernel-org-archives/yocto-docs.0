Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF61ACD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:41:15 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44034.1781880071146743901
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 07:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=eks8VjWU;
 spf=pass (domain: cherry.de, ip: 52.101.83.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsaWT/ccO17DzcM3CMTvitk3TJ7SsT+g8EHnVhvozTjZTLxT0v1J2n1zBEpqUaHN2V4ka0Nllq5sgw5XQdjd1gNqu13pPtEF+TLmh7U7OOBToYI99A80dgohUF0hOCWDLoLBFrz28ef3eKss7XTrvA75EbiyxD5u4qmxW6TtQg2yf9hUMQm5xgvOH4dlV20kwMptjqHrln7LTP/M6AvnMrt3OsXslHCtRP46RQK1RsG4ZF3UrU1hGFxweIKMLK4a/W2MA4UjIzWgAFHSo2cE47+8nnvYLB8EzXPk9rFi7dQv5kA204KLp1Gk1I/HzEofqJgQMDLsmPukE/SEx0WYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+fVFaI2Zu5+rnz9mbwmdzTy14PYkBP6Z21k/276p4w=;
 b=nUKzOWfgz3c3Q+wgiw2GPYpgOAeGZK35N757cp4wHpzebV2Esc/U1Eeyx392zCwoVyZW97sKqA6OwkTrqhwdA8YAzS9x13dDaRnbKYnSDZHRSx8uqHsZ9yqR7zKJIVZ6op3dWefJJ9R+Ul5GIjX1TTCxM3vPYydsnKUZ1rs78quEUkzh66+Uf1LVyhcxdIo1yAAqm+0Flx5LX1/zLdj7QhMgniifqZFoVTZxq7hlbY+yqoOA1h2+s0rPMmHwQUkxUr4bx8nlLs35berw78l26qJTGpDLcalWSm4jbmhCymsHaTECoNGg7+iLxOLEWznyqC4QjYkZwcPoGHSdpOjNyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+fVFaI2Zu5+rnz9mbwmdzTy14PYkBP6Z21k/276p4w=;
 b=eks8VjWUfDO9kefcTt7twwtlVdmszVabWC7vTHop6ZsEVA4YIFb/kVbYUzfBTdxtOF4M326Efad0iBCi+li/5RpURNljYv93dCWhHmryqGL9VMkQk75dvC4xaPMP/yQW5Z1FNfHIeIUXMhdmePAjIEQVya/5DRl4Vf6zUClOFY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI1PR04MB9953.eurprd04.prod.outlook.com (2603:10a6:800:1d7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 14:41:04 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 14:41:04 +0000
Message-ID: <73a0c7e1-ac31-483a-9508-369c9471c33e@cherry.de>
Date: Fri, 19 Jun 2026 16:41:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: drop "PREFERRED_VERSION" from
 x86-base.inc snippet
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <b99491de-f786-3ce3-d7de-104ba1660842@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b99491de-f786-3ce3-d7de-104ba1660842@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:803:118::49) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI1PR04MB9953:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a9bd04-5b29-47a2-3ade-08dece10ca82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	numfhBPou9ndDlhczuWcoRMLYb5EKpd7KQvEdzbHdK/2f3YSHLK00HsRuJ+O9MQEhY6xlAvUuseyOyl8yrHvHWy73UXKV0yw6V9I27tntxvfBRcai/vnYIeVnbybZ3BUFsjTzyuK7tlHlYisIo3DI92r07ipCJ2uyQHj04STaNPFKHalGOUHA47xYnAvCl/3X8ur1c9DTrgRU9DU3WoObYkfNuHgD2EH4Kw4lmxpKX4FkxWoS4ivA1v5kWTXXXAe6iz29bm+FNNhf22fHxfFlCnjWmS0OvHSxgBch3fLtxDZF0YAFvKh0ms1nmgPANxTi5m++zt482qqtd8RLOqbC/le9gBp97rqnwrvkmcg2bOq+818TEpSkhPkbzxndopiV/1ie68XeOcNLZOk1ZCsOOlZDyVsMLdxG2IJ9Cg2zbkoJZoGnorjG7Qk4vB9Wyk0q07ZV1EptQqHr77cXjEiYHzSvTU+G+KsOv+UBYR9qZ8wjPmgtmGxaIQTUM4tUpzzyTE9BohnBdeDcRgwKxlXtUw+TMxzMmKvBZx/dwtObea9PkxNUQBVN3DM3CBfveXavSWlJIfYEDIgwbUUV2bA3OMvw5ysztRbKVz49RhM+lagADhnuYZwX4zCgrYoNVnb0Q3eogdJIg2e5NIxjsqhjk4SJSmS4PCpyBQjxvFANPY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1d0NWpqMG9UMzFaSUp2aXF0NEdIUTNDOWJZQVV6TElTZG13VlhKM3pvTUVQ?=
 =?utf-8?B?TjZjUkhhamQ0S0czUmJCekR6RDcybDVVakUrOGF5cHlvNmUxaXRHdHlpMkV0?=
 =?utf-8?B?aytxNm1pNGRVUWlpRmFyenlRL3JyM2xacTIyODFQejh0Um5Rb1lURVdJQ3l0?=
 =?utf-8?B?aDlESTZIblBQbzJFM2JqallqTk9JWlZ5YTAzY1Y2TDNtSEYwOE1lS2tQN0RE?=
 =?utf-8?B?bG81MTRscmZha2ZNZHkvcjVFT0dHMU92c29raVk0ZTZPNEhaUzRKYWQ2OXdY?=
 =?utf-8?B?QWZNZFh0NXh6c3kzVUphcnEzQXBxS0Y4WUplRk1oUGYrcVEzeWd3UWEvTnVT?=
 =?utf-8?B?YUJ5LytrMjU4MFlHYzNWNFJ0UXcrbVlPNUtaWW5lYTJNSmNRQ3BwZkJrT3F2?=
 =?utf-8?B?NUZOYUxWbXhaUGNHQXJJYm9Vb1F1cDdoR0x4eTZNRkRTR0Z3T0Z6R3lOV2xt?=
 =?utf-8?B?bVc0YXZuWU5MZUhSWUpzcnBOUGU3RkcwSlV0cFBOMmN4akdBNVU2cXlpY3BQ?=
 =?utf-8?B?V2pra2dOTlVRNzl6RXV5aXkxbkFYVXJFOHhJOEpNRG9vb015Wmt6UHpqRlgv?=
 =?utf-8?B?elhsdTBjejNUVDByQjJ1ajNCRzlNUHFFejZpSm80WGh3TGtvOW53eFVoUUpt?=
 =?utf-8?B?Rk9laVQyVEtsc1M4Tk0zODVPTDZUQ0ZnS3ZpajdMOHpWSzFtbzNjOEQ0MkVi?=
 =?utf-8?B?N3Z2QnB3aEVYa0wxdTFtYzN6NnJDaWZsRDhIQ1hsZ0FxWHVJZGN3cElDd1NU?=
 =?utf-8?B?UUY2K3ZrU2d6QW8xY01sV3RndkV0V3FEQ3ZVUkFuR0QzTEl3VUFpNnA0OWRU?=
 =?utf-8?B?N29WUHhMb3FoekFvTWpYUllwWm8rQW1jeklxak1EaFV0Y3ZwVTVBZFpCSWtF?=
 =?utf-8?B?VGE2R2dBN1JqcGtoempVSEorWTMvR0JtR0Y5eXdxeHpnbEJxMXloaDRGdG9j?=
 =?utf-8?B?cndvRWx6OWFGajlPVDI3L1c4a0JIUlRGZjdRU2NncXQzcGFkdXdnMHJMNXJr?=
 =?utf-8?B?bWNFdk1xektwRmxUdGdMd3U2cUR2c1VDYjFZZGlHbjJZeUZGZFlhL1I3MWRw?=
 =?utf-8?B?aU0vRHhCSzI0Z0ZNbE9RTEx6RUdUTFJiVm9MT0lBVkFWcWJ6UjZYVXJpUTdF?=
 =?utf-8?B?TExGQjd6OEZHdXRDRlJtZzdRTThqWWsxSnRMWlNGQkVEWHZEOEFnK3VCLytp?=
 =?utf-8?B?MVRubGI1Z3VPTjE4TDZYSjF1VkNJQlduOEV4WXZLTkFWeXFkcHhJazl0aXRN?=
 =?utf-8?B?M3ZKcHZBRC9RZVZRY0FMQ053SFpYUkNnRFoyL3FFZUIzSWtlUHVFRzlXdFZi?=
 =?utf-8?B?MXJId3hZOHRpeUZiUnYrbUdJbWpUTW00OHI3aWdjckJVUFZDdXB5anp6WWpK?=
 =?utf-8?B?SDI1RkNHQi9OampUZ1UxdEJSQ1pJUnBXZ2VFZDZvNFN5NDdVVnBjYUk1c3Bz?=
 =?utf-8?B?YXhkaHp6cVhjU2hrbDJmSVNsTkczcFJ4TThZMUR6L0ZCcE5PMzdDaktKTEU2?=
 =?utf-8?B?VVFHNVRUZWxSZUZmVFN1RGNieWZYVmRDd3Bla3l5V3pJZm1MQ1c0ZlZSZU9E?=
 =?utf-8?B?aytaT3VjdkpYTlV3Zmx5WGsvZnFLTWFSR0xna3VneHpnRzlpc0pGNVFKUTJh?=
 =?utf-8?B?SXpPaFMwQkFxeE83M25MS0hZbzhYTkVVaCtNSmhpUExacmNoRlFDNkxoV2c1?=
 =?utf-8?B?b3BRMjBYdXVpaDVUbXZnMlQvbzFQUk1FTThDRXF0Z2tMck1sR3VyWXovczhP?=
 =?utf-8?B?S2gzNmFQVXNmWUJNN3BGam5Hcm5FcWJjRm1VbTlZRmpSQk8zcXpvMWxOWVFi?=
 =?utf-8?B?RGFWd3JtbmlCVjZhUTNBQ1B5ZGN6SjJqNEpyZS8rNjdaVVhtMnJBNjBxQ05z?=
 =?utf-8?B?ZGtiY2NqRHd2TG5aRGorOWdiZ1crUjJBbzRGUExzS1JLRVo0cXBHdWJGZ0p4?=
 =?utf-8?B?L09PZ1dMM0hVT00xa1BKaXNURTNDUVBQOWlwNzB0NzVlczFPdzllbTZGN3lV?=
 =?utf-8?B?TDhrVHZMcUlFL3hsNytSdmZ6TEErK3FPUTZLRGZ1YmpXb1AyMVpGQXBNRHpP?=
 =?utf-8?B?SHRQK1dQWHRvc3JUVTROdy9WSmZoL0xnem1BUkE3TjY3UHJUVnUyeEk3Y0I3?=
 =?utf-8?B?cUJGODdOekdQN2pZVUo1TDh4NEExVWlFS1Z5M21TQTFQTHp1cEVGa3Q1cU81?=
 =?utf-8?B?b3QvbmhPdkVFMmUrV3NEMjFiZUNNeHk0TDVTbWhjN2YvdnN5SVRQaFppeXBn?=
 =?utf-8?B?bTRxc0NJR2ZTUTFDazJuY0hwQU9CVWJEK3AzaEFUaHlsY2hGSlh6azhCTGRz?=
 =?utf-8?B?T0xQVFFhbUtpVVQreG0ra1pET1ZCVkFrOExvaHUxVTJPWkpVRjY3QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a9bd04-5b29-47a2-3ade-08dece10ca82
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:41:04.7478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /x5H8KrPFvcD6cL7/3e2QODRjTyWhmt4Ncu0BmjJVfBdsJO1N5W6MbGDkK6spJfE866lPFb6rUZpB4eHZlTJsHjBe3aDq24D+ykxAC2VPeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9953
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 14:41:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9789

Hi Robert,

On 6/9/26 4:08 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> The machine include file "x86-base.inc" no longer includes the line
> setting the PREFERRED VERSION -- that setting was removed in commit
> 298fa078fab58b64246376ffd70ad6a0c7589876 on Oct 1, 2023:
> 
>      qemux86/qemuarm: Drop kernel version overrides
> 
>      Drop the version overrides for the kernel for the x86 and arm machines
>      so we can go back to following the distro versions. The reasons for
>      these versions is mostly historical at this point as the issues were
>      resolved.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

