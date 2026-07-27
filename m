Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC96C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 17:16:16 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36493.1785172571463245928
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 10:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=asYBu1hG;
 spf=pass (domain: cherry.de, ip: 40.107.162.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDr19TZJgQ7B66p8tQ74ktVSRbeOjf1053nMFckw8btB5LPYkqniSu9/C+T/gyBEE3Cd435oR+jCCcKqXKP49VwhQwoQoTOwhGnnMKxdjwEXqkr/OCoZL1bqGocSLh1jbP05bqY338Hw3UYCfbUsB5llMwBFjqa0fnzu1nAaJXxWt9ks2VsdhnYNLJ/xV01+aZgDDnaD97AuCTzeMf8BwfPukcuMYdO7H96MbJqdrPhDhISByHkPupKGv56tEcWZKXMlyBYv9dtZInQpeNi6qvgGRTEzEqn2qXkinN5OuOu6ZFiRww6PHgpTTqIroG3EBU8pmQfINamM6J1Z5OhqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJrgnvsx+g40ZFvpWuyqO+wlz8mAp1etpK+2++V2/tM=;
 b=vnGkCpu4iOcj4I7APcy1w7pj4gyv5OQSM4F5+Hmh8g+orgcTRUe41CpbojVuIz5HvwK0LGTjuY7m1LVoVWLDyHz1K/QPJmmBe9PYJpfrOTO6TE8QaL0mf2h/UacdZ3ZpFg3+F4QuLxG1j+RMZd5yKXvdAxD9f1Dm8pShiWf3iIMDntO4Fu+lXu6bOlgk3JkNo0Uef5ozIyrtm6ShnQrIFhjr/fgEyxgCPWyyvO9U2/JSRjtVA9oZO16VJZwLS+d1wyVjw3QQNkkDZseew73fqkGg8nCQK6tT0kCzT9NyJer2arJiQH9a5A1d/nne+s2+yHlYQJ02N6TGDqF+55IioA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJrgnvsx+g40ZFvpWuyqO+wlz8mAp1etpK+2++V2/tM=;
 b=asYBu1hGBMEZyaOX2OuksGNw8VtX0Ep5dx76lIzPMnt72DQ/dji6I19IQ7rDb9p2Xkv8SG5v289C927aqDQrbtOiQxIIY+jvGqYPKJd/NqdnxoPSrD7MbbDv5XZF4VqV/UkwVRoVqykE97GSX8TSKO9kuuQypXQAmMPrFPzXBbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB9568.eurprd04.prod.outlook.com (2603:10a6:102:26e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:16:07 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:16:07 +0000
Message-ID: <7340b15f-a436-4aec-8dbf-6ab3e80cc2a4@cherry.de>
Date: Mon, 27 Jul 2026 19:16:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/4] ref-manual: Prune superfluous space with
 :append
To: niko.mauno@iki.fi, docs@lists.yoctoproject.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
References: <20260727163529.30595-1-niko.mauno@iki.fi>
 <20260727163529.30595-2-niko.mauno@iki.fi>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260727163529.30595-2-niko.mauno@iki.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::23) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: 121e2248-e8a8-4a97-fb49-08deec02befb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|56012099006|4143699003|10067099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	ioLb9Oab5Z22QzGp8gQcM24jEqUo6Ud6e32ayHvdFQ/tA8xdWQT97DeHbzYDyaeJ08j+ejoKesHMtigH2Nf5eAVxP5P8VYa8G11Mul62a7hnTQucMwgGbmrFhT/Aga/UuM5R1ClxdgAH5dK3icIr3zEPzC+phyCpcT9LBFpFCX224iEBKIZPvdHNhUXgMZsfqRn4/+7JnzcTNLWAZFg4oNDdZhiw45l0/X7DQnAGJRZXPUR6KuzlqbF7dQM9B7dWETa5jtz8+dzpFpzuLnbe7dd4gvKaqdoyO2fLX02Xs90h9OF26euPh8tFCY32QNSMerDJzreJokC2zzfAGboS0vecZY7NTgbXts/16DVGl0n5nJ4b/oXRsJJepJNqtjXKFmpb4e9Xpvo/aOEvw1DnZDxcYONAw7woiNiLex22xtTAHDGOvumbNNPQozcgjfPKhGyZiGtYXIYDlcELS77Ri5DC5tK/trNVRciI4tN8/CSt0XBWPj9npgbrOi7/3AjK5v4ofcBfjMkG/SsOyc3IqMDfzV+5fE7gmq8Be1Mdxv1ytvu6N8JAU8oD0niVxKpcNZnzVHW1B94+DMj6cazGucz8eIpTow14zBc90g63CtMRgT6fjPe+rRUW62djdF0n14ESI77w9IPJs30ME8xxFm2lqT6nosPFHj+DhYvTJ1A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(56012099006)(4143699003)(10067099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVp2WmJDU3NCaFVKU2grc1o3dXJHODlveit4TkJMZE1lOC8rL25kMEhIR3Bj?=
 =?utf-8?B?M2tFSUI0N3ljanRlMHRDcm9hVVMraHRQRytvNDlKN0E1RUdzRkpnKzNWd2RW?=
 =?utf-8?B?UFhEZjRZMG5GaFlIQzFEN2lIRk0wT1p3OUc3UHRkQVpPM3psTERpcVg2TnlB?=
 =?utf-8?B?SmZCN1ZkUmV1TlpVZmh3ME43UE9CZXdLMmFQWW1nS0VKdlV6WEtZUEFBZkZI?=
 =?utf-8?B?bUdaQ1FqeUJKS1pZSkJmVWxQZXZ2VmZvNTNPZjhpY3VLR0UvVXJxSEhxWUto?=
 =?utf-8?B?RXZXRkoxZmtOYTVDZ3Z5ZWpzYzFld2J5S1pkQXRrWTAzbk9wS3RzemVJak5p?=
 =?utf-8?B?TTIrejBOTzhST0xZdWN0WVJpUEdPNXQwZnBiM2d4VWdxQnRuclZxUXpLeEI2?=
 =?utf-8?B?eHJsYlVySHFjM0dnZWQ4VHVhV0V5aFFEVVNyTlY1ZnM1dHV4MDZvbktWWHUz?=
 =?utf-8?B?d2pJYUtyMjZyQzJRbjR6aTVCcVg2d3hPODQ1R1pUT0FISkxwQ3pMcnBhTUVQ?=
 =?utf-8?B?THhjVHFqNDVoUy9USVFqOUs4ekprYTkxcDlacVlGN0J3V0dkVG9GNENiK0V4?=
 =?utf-8?B?RnlIYnNGOTZFK2tjSFc3WnZiL1FGaFdiU1BMaW9XZy9kc1pOZzRwcFRrbmh4?=
 =?utf-8?B?TVNTU0p0OVpJckNZdXdVVncrelQ4eTVkK3I0ekRzMnU2OXBXUWhQQm9pUCtQ?=
 =?utf-8?B?WGxVZU5KUVk4QU5KaHJvMmRxUXNRaDlMQzhDVUpBNTBUN25mOEZwTzJQSVVh?=
 =?utf-8?B?QzlrNzc3RFVsV2VmRjFEdzB3aVJHdnZ5TlBJOTF0aG01YndnS2VUNmpEYW1m?=
 =?utf-8?B?TGZicjRtWVhPWTBLWG1hMkJQVlRwa2o5Y0ZGcXRubkpWN0pRMVRndFI4cnpn?=
 =?utf-8?B?Z0U3M0lWQmdBbUxNYkdhYWtuR3B6M0ZMaFZkaGdXVk5GRnNaZHpTOTV0bk02?=
 =?utf-8?B?Vmc3cWIvcC9vMldwTEZidUpyQ2FwNGc0SDg0MU42N2QzcWtjWURZRWFXVTJS?=
 =?utf-8?B?U1hXODNCMTRwZVVNSHVPZ3c0Y0dNWnBOc0pSbVpEb1d3ZGIxVTM3YXBZOElR?=
 =?utf-8?B?aG1SN0ZjR3ovSkZ0MzVDc2RpU1dVMDlQampiU0tBMXhtTStJN1BlSjNJdU5M?=
 =?utf-8?B?WTdkdVNlRVNsc3J0eWFxTzhhVXhOOUVIMnl6MTg5emkxc1JVdG50RVRpekdL?=
 =?utf-8?B?eTZrZHpkWTYzN2c5M0pIeEJsQzdkRjRqcWt3K0srSmFWR0ZYVndaV3FmQmV0?=
 =?utf-8?B?d3FiWVJhWUJ0M0J3UFRTTjEzTWRoUVhVQzZJem5EMUY2REZWTlpwbldqdy8y?=
 =?utf-8?B?bXBNdDBGajhVUmFQUnZ0RnlIMGlHNFk4RDlWMlpxTHdKbEs4WXdZVm9FY0I1?=
 =?utf-8?B?ZU1KUzBaUG5uVmM1NGlLcXZWZTMyQ2tNaUNaaHVGL25IRy9XTmg3Ukd1TVNw?=
 =?utf-8?B?S2xadFNic1dueWxtc0FTK1M0Zi83ZTRNL1VJRUw5RkRad1Q4R0IzVVk4Q3RV?=
 =?utf-8?B?NG1VUFpybWVyZ3FKZHZ6NklZQkdOTjRUTCtNS1pkQ3JpekJEcDl4SlBUUFlM?=
 =?utf-8?B?RUZQTG1NbmlwQW00bXJPSUJyVVBjc1A0RzBnS0k3WkwrbzltMU9JeURvZXNE?=
 =?utf-8?B?dnZwWnV5UEsyNEwwcWZNVGpmaGwwUFhpaU04OXVBMUtsdE1Wbnh4UVU0d0Ew?=
 =?utf-8?B?dWJyK1lNVk9pZ3p3dk9UTFJsZ09hQUtGYWIzU05zL3V2dFB4dHdDMDQySmtS?=
 =?utf-8?B?NWU0ZGErYlFTWjZpQ01LVFArN0h2eWRwWnp5alRQR3NHdHRSSnlVWUdiWGxE?=
 =?utf-8?B?SmZDWkJLeHdSZmJIQ3ZDSjJSYWFFdkt4cjdWeWxEN1p1STJ0SG14SFlhVGxr?=
 =?utf-8?B?K0g5bEpyZEc3RGFrQTNrSENZc1hIMFY1TU93RUdUd2xnWHFQWGc1ZE1mU0dF?=
 =?utf-8?B?cUlSVWcycTEvQ1NQaE5IckcraWhCeUFjNmgyR0VoNlVnWVE5b2JkMnJDVVVy?=
 =?utf-8?B?RWRFQ2tvRzhNR2x2QlNabC9WQk5SdW5TZVg4eFhHTTFhSHZJdVNzR1kxU2My?=
 =?utf-8?B?SXVuYTg1dlBzSnRYQmxHYm1Ebzdsb1NvVVU1a3EyRFVxZmduQWt6bXhYVUR6?=
 =?utf-8?B?cHhpV1hJVFRWZTdDaFhwQnhDQXJtdkgxVmdjcmZoL2xlenhYMFJFaTcycGtL?=
 =?utf-8?B?S296VlN3S1FJQSsvSHRQaitRN3hiaDhPd0lvekF4YXZnM2NLdElTSkFaSmVj?=
 =?utf-8?B?bXdqUkVnT1QyYUlvYXRIVXpFckdNRVI4Vit1QWQvVEpYM0hNQWJ0OEMyNkx3?=
 =?utf-8?B?WU44OEltWHVaTHNzNnZHL0xLS3orOWpzQzcwYU1TTExtcmlNNERCUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 121e2248-e8a8-4a97-fb49-08deec02befb
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:16:07.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/QyW5TtpkxuGcqQYK+rzL/LSg5/CALntqGHZFPHPHE85+h5cFvBEziAhhAdXw1AWHL7NLJyrbu4D/6RIQlsBJam1WS9JTCZehxS23rPkQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9568
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 17:16:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10148

Hi Niko,

On 7/27/26 6:35 PM, Niko Mauno via lists.yoctoproject.org wrote:
> [You don't often get email from niko.mauno=iki.fi@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Niko Mauno <niko.mauno@vaisala.com>
> 
> Remove occurrences of superfluous space characters in value field of
> :append assignments.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

