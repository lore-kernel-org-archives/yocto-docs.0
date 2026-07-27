Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D959C53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 17:16:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36505.1785172593944709665
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 10:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AtQ2HhZo;
 spf=pass (domain: cherry.de, ip: 52.101.83.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qisc/dCLMV3aF51RgoPjAfqFNY38dqCEdsWv7hpIeVIZSq3EYsQhwqedMbWIfqEReJDB8jPAi3lnYB0CXTRsOF20JKznQ7UEa5Ej65eMlj0m5pgtbVMpVIEQj6JcqS5nEMHNzCxwhU9+50Cn4x2FcvYKtKuIdbQmb14QUodoL+oD4gPZOL1YpLpmu4f5mnImx8HEk+Ya7iCjpCod8jmuDUn2rkRZdOzNeGWASVe3YaQCXOvDAcgOgPA78oLy1jS7F0XWPKzH5IU4+LLlsSYzc83YBnhAL44htM0psupKly8ALcZID+AqO7O6daDRIBs5Z1ccko8mlUOjUkNzhd6gOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9qndkJptOqie/fGkKL6ARPvtLSXydJinkUfLbdcLIs=;
 b=lWxpMRw8+IZmB3LOZibUUf51gkfGsXj4YwPfojTLcCKkbpzuTo8m1P78zs0pHX/EnnSTZXTFLlvPVVZNJSkZnhbLCbq6LMVXYNpHCUMDhwR2r+vpsrJKLEcaJY2TzmnRToBe9T2XVgBCfARrgpXowRCF5VXYWyAERcJHNedRIBjLYFl1sOIdXZZY6hOfwyp0pivFdHGitKH+f3eUYFYYT0lx0Px8bSsYnzO9jDTwoXrZyaW2PD5DPqx4EOjVGRQKxMMqGv8GCPfNey08S5O3JtrvRMJB75uBf6AMEZEqa1P6VDx3nHom7yfc7dm1Bl4nj4MNVR/H8MbZN4pMt/7PeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9qndkJptOqie/fGkKL6ARPvtLSXydJinkUfLbdcLIs=;
 b=AtQ2HhZomY8Nh0LJ3lsRsF2Ufwv8lqNQkGw5u3C9fGh2kkVJKALK3VvNFJpgXu4VyXCeRvqryQ77APfY8kF8dXW/YgijcozIVhT/3vCHrlDfOi5XScamqw5sMfdOGgCSNDsOyF/sVM3Z5M6T5OJOFmRShbPgEimy34NJTfC16q0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB9568.eurprd04.prod.outlook.com (2603:10a6:102:26e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:16:29 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:16:29 +0000
Message-ID: <426ff74b-db18-4704-a639-588713a13e26@cherry.de>
Date: Mon, 27 Jul 2026 19:16:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/4] dev-manual: Fix missing whitespace around '='
 operator
To: niko.mauno@iki.fi, docs@lists.yoctoproject.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
References: <20260727163529.30595-1-niko.mauno@iki.fi>
 <20260727163529.30595-3-niko.mauno@iki.fi>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260727163529.30595-3-niko.mauno@iki.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0022.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::34) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b44585b-f176-4ebe-1789-08deec02cc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|56012099006|4143699003|10067099003|22082099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	QcplmOhdlmuXOskQZvwFZ7a2YE8r9cgOXDRwLill9CUGp6m3qjsGFzBksTup/PDmEBHjPJoFxBLEJ3NnlJtbQUUDq4gtRasHMWatgXmqjvyzMaC0iVq7ByD0lmMWOoVSzRz9Evr61J6O4tZhPC81GzA1T+0SsiqcDi1gzS3pfhwc8uUB2WmTH1Vis0wLFqzr5Jma8+xGL6OjukppEHdT3lXFMrpK04qT2shkajv2cL1Qjypnwjx4WuAtefb/FfeOlUXgeIIP3TViypdkFb7ZxwkqyOKl98JLsqOJmtLJTOonKxgKVk6wekebeMs4Yz63MZ3CA/W3E0jSXkKTTYrTKri/AO4sL53uSRL9Sja9re9k4rRTVt8ZTcHmvG2z86xFm1pfUS+9Ib0OqbgRmDaU7m4jK6FDgvI99qWmn7HjjUPhBeGuXTuq6M3M6sj1o4ub+IWSwFlRBmY0X1KEhP306h/Aywa4jhFmLwQOn3PTx0OR/NWsY8qZCZcZUZzaZbDZ2klXbJ3XUgxaE2Yy9G3S+YsPJvHAGWNWZ3sh7RmojAFkwpMaAxeG7SnY0RAsKZB5OhEimHFgqeP5gTdZ4RQX8HpuoTlJP+R3uDm9RRhaCmSBErW/NqEACwGCD/rV35sqCxZXPwxsq3cR/lmV8n6O95xSodMdxZu44E2nMJYkVGo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(56012099006)(4143699003)(10067099003)(22082099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N0lZa3lnaFhnWmJVdmttVENNN1ZpT1lhM3JsVUNtdzZZQjBWRUtLTUw4OENm?=
 =?utf-8?B?SG10d09ZdURTQzUxd0hTaHFtVm5vbnhJZ0d5T2VxWFJ4Q2psWkpCQTAvR2I5?=
 =?utf-8?B?My8rYUlIOUZpTnl4SFc5aE1tN1FFUU16emQwOFBTc2RHb2p4SnJnTmtPWjNT?=
 =?utf-8?B?b0ZBS2c4Q3RQaXZrL1ZRODdSTEt5czdpS3QrcmtseEpqTkJ1YnE2MnFDTHVH?=
 =?utf-8?B?RmpaRXVNeExSMnFXWHdVUDhKUG4zYnNPY2RyN3hIeFJSKy85TnlYL0w3eUZj?=
 =?utf-8?B?V3dncHkxNVBpcTlrbGlBQnVaN25UV2xRdGNjNWJlbXVxWWY3MDRuUHYvQkhG?=
 =?utf-8?B?QmVkUUJ6bkRVUGVPVVdtVU96MmxoVlFTcDlQbE1EdlJWS2IvTklFa2FFNTRv?=
 =?utf-8?B?MDRHTDZySGJsblBhYVZuN2dIOUg4NVRXV3NEaTBlZTVWVWhDL1o3UzA3RU1I?=
 =?utf-8?B?RVVoS3dkUGp3TWcrWnBxTXh1ckE5U2x0RDlOeEN2Q3ZtTFhmVE9ObGx6MVNT?=
 =?utf-8?B?VGtRZVFteXhEeG1mNFpxRGxyTmNyc25ZZDZtMmEvZjIyZllXMjVYZWRJdUN4?=
 =?utf-8?B?M29KbVd4T0dRU2tPMHRHeVhlcWlId0pMNEhab3lwNmNROVhmLzZEZWlBQ2dZ?=
 =?utf-8?B?YnArUzUyZng5UnhFc2dwai9PV1dVVmRhSU1PckJ3bndGdzJRWnU0OSttbk9T?=
 =?utf-8?B?bUlLTE5ELzloM3dOc09nMWNncnZmSWNkWnp3K0lwc2ZvaDdHNjV0VC8zYTU5?=
 =?utf-8?B?NExFLzBwNjE3VnZpMmwrSG5zQWVyRnVCU29iVmRMRkgyV2ZHOTlxV0VsNUlV?=
 =?utf-8?B?bCtLUWFoK3JyMUhlRm5ud3NReXVpVFN5QlRGYWVBSXUrSFBDa2lsY0lXci9X?=
 =?utf-8?B?UGdnWmZwNzRNNUU0RlFTalpBK3E0V3VHSVFrME0xNmVCS091WVk5ekk3VFpw?=
 =?utf-8?B?MXBQM0lWYjhwY3lDZitYMTFJaWxMcTB4U3lUc2tnNEZxZERDTTF2N2FaSnZ5?=
 =?utf-8?B?b2xQSEZ0YStaK25RdCtSa0VnUEZJZXRVMHBxSUtSbHlqVGdnNFNmTmY3Y2N3?=
 =?utf-8?B?RElGank3c2trMUNMWVcvUE1oOHRSbEFtWGtvblc1WVgzY3IyS2ZlOGJmK2xJ?=
 =?utf-8?B?L2EremFYZWZ2N1NBeGRBWjRTeUpUeVp3cEZmbDIreVdhYkl5M3h6OEFuVS9H?=
 =?utf-8?B?d1lHSm1GdEpVYWlFL3RsaVJuaWU5ZkYvTzE2cm51cDkvMldvcklNbHVOV1Zx?=
 =?utf-8?B?RVBDZDBvcnpYUkZIUVUyTHVzam1MbkJOaHA4eis1SjlyeVRIcWMzZFpqUnVw?=
 =?utf-8?B?cXVEcFRIRXpQTUR5OFZGQW1WcHBzMjI0VWNPMTRwZDIzb29LdENlMnBWOTUw?=
 =?utf-8?B?WFI0Rk92cmI0RW9BZ2Z3VGRHblp5Mnh2VDczRVJWcmQ0U09CRjh6UnNnMXlo?=
 =?utf-8?B?Y1RUS1VJOStXd0JWcDRtczNJcTFpS0ZxZWpOdjZyVVFGTEhVWmJtUjhpYmdh?=
 =?utf-8?B?dXFzS1ZoeXVIUUppV2ZFNlFUbXFIYkpkRXFoVG9aRkUrREdsSHpWQ2FJYlM2?=
 =?utf-8?B?SnU0MFZxbnVVck9Za3ZhbWhKV0JFVEkyRkZHbTZLaU1XVXlDbE9iZkJMdW00?=
 =?utf-8?B?UndpNklDUzd1Z1JrbXBBVmVlNlJjL2FDUmpZcncwaXZOOU1tQlQvVTRQMXNH?=
 =?utf-8?B?amRsd0huV28yS2xvTmlnMEJRclRlT3ozSjg3bUtHVXR2TkRuSFl6bUlEbzZj?=
 =?utf-8?B?aU5JVG0zUHh3dUd0MStGbEprUzVOeURPbGZvazlvcGFjQkEzd3RxVjRZQnNt?=
 =?utf-8?B?K29oelVSVFd6a3RETzBqR3FDVzd6SUlVSEppaVFQQVRNa3RGRkQyY3ZqWXVi?=
 =?utf-8?B?SXQxL3ZjNExmaytGRmk4YmZXRmhieVJONW1MRCtlYmk4TlRFbHNGUXJmb2hM?=
 =?utf-8?B?N2pMVG5NV080L0pTa3hKYWtlcVlKVWttQmtqdGNpTHBEeTRBU3psZFJzWUxm?=
 =?utf-8?B?VEQ1UEhHcXRYdk1VdVJJOTd4MHgzdzlXUUdSRWNkSFczU1V3aDlwQUxVQjhT?=
 =?utf-8?B?N1RBRzRSUjBOMGlsd2N0V3VDR0JYYTlWNDg0QWRlNVRCYkx6TmhXWDhCZ1Fm?=
 =?utf-8?B?KytOeHVDR1pVcG43OXBiQnl1aHJvRm1LaHZBYmZwTGFINUQ3QVIxbUp1NmFD?=
 =?utf-8?B?RmFrL0x2RlFjRGYxTzFWb1ZtTDZmZ2gyc21RbkpteHNtSkEvc0VRN201N1RG?=
 =?utf-8?B?OUJwU2hSanB1VEMzcFMyZ25NaC9PRUhIamx3QTVFanQzVFpNRmF6Y3FYNm1F?=
 =?utf-8?B?dFUvVnUxSzJieTAyeUhKV3pyT1RlUzRxRVNsNksrL203b0J5SzNMdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b44585b-f176-4ebe-1789-08deec02cc0e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:16:29.2110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YNi9C/s1FyocQSUA5tEL4WQPvoP3KE5P6XIyooRvgZFEm/HI+WCrXcG2wQlQnvebEzpbF+XrxcYtva3BMtVKEnA7qTc8zPIFmqNra7mFks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9568
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 17:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10149

Hi Niko,

On 7/27/26 6:35 PM, Niko Mauno via lists.yoctoproject.org wrote:
> [You don't often get email from niko.mauno=iki.fi@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Niko Mauno <niko.mauno@vaisala.com>
> 
> According to the Whinlatter (5.3) migration guide;
> 
>    A new warning is now printed when there are no whitespaces around an '=' assignment in recipes
> 
> Fix occurrence of example verbatim applying of which would generate
> such warning.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

