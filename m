Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50723C0219E
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 11:11:49 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.73])
 by mx.groups.io with SMTP id smtpd.web11.48754.1739790707886789898
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 03:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=T/LBtgqI;
 spf=pass (domain: cherry.de, ip: 40.107.103.73, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDPrhujFnXelxm82HlyGbgRyNGHBdc8DxIkE0+XaMNrnsWcZMMXi68avDXa5rKAGS7043/kH0BL6GmsegjLICKiZVF0R4MTSuLa5/kpAYuKm5w+LJMCYvc0TylNhsAlz5ULK/ir0BOcCJY11o/mno60sykfUjkBew3c7Iw6KLJ0Up+nZnnA1iAOwZQquHrJ/qsWqYloBgaODgH2khAahXie9B1oK0hi5WY9VMx1oj/CyRDE4V5cTfASaWvs1fB8egErkt7XD2JMvzVupY1wwowCfEB6B/TQPaOkKvbIfraVVUt9CaFYOoEQyoYWHA7zrsN30omi6OWl3jOYSmOyG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gYCbg5vJM2xT0oM0QcCbwFXS9z5DeHTX1vpvkhVbFI=;
 b=qAlXhq3MirUQ+gWx3K06VeC6beEeS2HHXKQUZrqMoLzvxSfiKADk405ttDg2B9mbQurKoFJfeGhVOguj8iSPtwLHEweZtdchD2TF7vvYGa6x6FS/j1Tw3643leu3fhY08feQtli6GpywLjsh9vbFMWtRu0q4dEb+WIUL6ZF+lhpEN3oPTnneJ+ykUKim85arMFYY26wl1WrAKCydXJYsP5Xb7tEOB4XnYGztL+tOOv6zzV6R86a4PoWQNw8vvZsNM9i6l7+ShCHvpik1A2qdaSpIjBiZigyhECc17CNoofti2ySr0FV95JknWNZ3yHCQM5LQ6tSrnlqYIE4Yw7yN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gYCbg5vJM2xT0oM0QcCbwFXS9z5DeHTX1vpvkhVbFI=;
 b=T/LBtgqIZLeQQKAXql19jQtej12ehOG+5iI0o2Yc9/UYZbkPmEMaG5FCGvrMa3GeYBlGQJENKvRRpL3Lt6wUvW62Ju1sOeP92rfpOwv8G03jeVRzyn/9wskRLhIvuJN81nXGUnA3dND3R1hzmtDPWaixIldsBlh9K/YB2U6s35Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 11:11:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 11:11:44 +0000
Message-ID: <7fccfca6-e546-4b3c-a82c-f66ece75ecaf@cherry.de>
Date: Mon, 17 Feb 2025 12:11:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v5 4/4] release-notes-5.2: Add new variable
 OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250211234738.2633971-1-yoann.congal@smile.fr>
 <20250211234738.2633971-4-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250211234738.2633971-4-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abdde76-5536-4b9c-1e8e-08dd4f43dcc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eTVYeXZDNm8xbnZ1dE9udjhVcTV1ZVhybmpMZUMwNkplaTVqMmxQelVyRXJi?=
 =?utf-8?B?c05GK0xBQW5sVzBjUVBqL1BLMGtqNTlFVHp5NGZlOHlPWUhhL3MzZGtRdldw?=
 =?utf-8?B?RzdrdllxV2VYQS9aQ0I3cGN3OTlpanhaYWE2QVhCN3NoU2JwcG4vYnlMSjhm?=
 =?utf-8?B?aXFLWTJaVlN6cEV1TmxaNytua0Q3SHdEWFIrNkJ4emt5dVpMVzZ2VEk0RHd3?=
 =?utf-8?B?SXc1U2ZHamRwcVc4OXZXcENWelJKU1czSWlVeGhORTNhTmpLUTF1NStXS1pl?=
 =?utf-8?B?Vkp2bG80WVMrbldqaHEwMUdacWNnbzRkZ3B4Q3J4QzdCUnZCcUFpNytBOFFl?=
 =?utf-8?B?K1NJVkFCbWxnSlphWXNMYlFueUY0aTlhKzhrbnYwWCtnR0xFQ0VuOVVJYzlx?=
 =?utf-8?B?eXZpSGo2WTROUXFWa2xBblVJcURyYWRWVHN0NFoxWm14ZzVDTS8yQnhSQXBn?=
 =?utf-8?B?ZGltcVUzeHZ0NVlBcVFiaWpOZ0lFMkRtRHZSbzNISlh4bjNOWG5nQTZxVkQv?=
 =?utf-8?B?ZzREUVhlVmxMUXpHL01sanlTeTlEa3FJVU9ZdFRIMEZnWjlSQzlqTjZMK3Z2?=
 =?utf-8?B?TXVHSWtSSlEzL3QrNmtYR1V5TGRhRll6U0xFbFBBbnRtN2ROUlpMNjlkZVV2?=
 =?utf-8?B?VnIzdHRBSkJvaVdXRE9HK3F5bHdyK0tQRXpRa3JsSnVZcHk1bU9Ba1VGNmxa?=
 =?utf-8?B?d1dFSTJ5encrcTdMS1hZSjBPNHFpbE9PYzYzU05SWGduNnJYV3JwS29NN1Fu?=
 =?utf-8?B?bnZoTFpzd2FSYUw4QW8vQ0NUMTFhY2FVNkhzbSsyZ0J2VFlIcnZBSG02UUhn?=
 =?utf-8?B?RjlQV0xrVkN3ekxNVDA3YWJ4R1h3OWhqMkVNNW9hc3ZoTlc5aStvVUtiNnls?=
 =?utf-8?B?OElRYis4Nm5UTXFmNUJ5cG1yU2dOcWlRa204ZVZIQ0d4YVVwWDRRenhXcnEw?=
 =?utf-8?B?d0M1VkR3QXVvWGROM1ZXbzdTQkhJdkZhK1Y2SEgrYTVRN1RjbWZxTFB6Tm1R?=
 =?utf-8?B?YTloRnlVd2ZIUmZqU0RwdzNxckZkWXJCYjA5STA5NlhYR0pESW11UlVTdUQx?=
 =?utf-8?B?MjV2Skc1dmpRWlB1YUwyREp2V2dWT0gyZ2o2SmE0Ti9RS2NkMFVwdDhqclQz?=
 =?utf-8?B?cE5IU2RlcU1IOHBuOElQa3NJOG5ETmRkQjEvRGhRQ3kzamJwUzJWbWtwNThM?=
 =?utf-8?B?OXl5Q21YSktycHBLV3gra2tmRUNlQStNY3RSZ2cvR1dVMkVWY01pMVFXamRy?=
 =?utf-8?B?bGp5SGVLY01sQWpxdWZTVkVHWjM3UXFDT3F2bXZYRUxYeDJ3TXpuQllmcjAz?=
 =?utf-8?B?TkFJUytKSFk5S0N5S2lZRHpjdDRaRG4rNWNKWUJxMHQ0akdTY21yUVhnVFZC?=
 =?utf-8?B?dEdDSzcyRzU3MmRqdlhyMWtSMnNvcFppaWZOMFg5WTRHaWlWbE5uV3ZWYW11?=
 =?utf-8?B?OUw3WllPMWNFNVpScXdTOG1nZloxdlhob0tLVkVJd2ZQakJEZkU1QlBiZHJw?=
 =?utf-8?B?ZUdzdXg0TG5hQWdYbURQcE9sVzNWR2FzZDFlZm4rUFJKMnJkUVJlZjU4K3lJ?=
 =?utf-8?B?Z2U1VFNPUTdURU0wbnFCUGlzdHVwTm5vdkdDTGo4c1ExUDR3cEYySXV3aUUx?=
 =?utf-8?B?dWExTHNuUTJyc3F6ZGdLM2xOZytiUnM1M2FiTkpHbEQ0WjRibkNwTFhiemFB?=
 =?utf-8?B?WE10cTdZbjNoNSsvTFA0RXJMdVZRTzZmRWwyT2ErSEdqdUVKYm04ZDV6WGF6?=
 =?utf-8?B?NmlONmxMRzA3TGhLS2dXQWE2QVFXM3d2eEttd0ZFMlF1RkZYbnEyZ2IyeGFr?=
 =?utf-8?B?aFNxL2I1OVBrLzFsT1RnQnBGTldmZGpjNlQ0OGpPS2NqRG5odXJrLzdZVkVj?=
 =?utf-8?Q?PKEPY+preDVKx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1MzSi90ZnR5bmgvQzBCQkZzalFLQ1MzaTMyQjVGOVdibXdmU2RxVktneE5L?=
 =?utf-8?B?eWxRL0xId1JmZ0pWSmFDclVMWnhqM2JjeXAvSjFCK2IxdkgrT1RFVGlwRUc5?=
 =?utf-8?B?RFZaVTFubzZ6ODY2TmVSRGZtL3BOdmNzdWlXVUEzZmVZUGFFSHJqczNxc0Jy?=
 =?utf-8?B?anIvaUtEWnBIaXZLTmtXZ0hPalowbmFVTEhYejRzeXNoMjgvaGxUUmVIQ0hY?=
 =?utf-8?B?NmwySllnTk5qa25JS3o2U3IvdkZhVy9NaHo2WGRjK3ZxdGErNThXMHhDcjFP?=
 =?utf-8?B?QzFpTVFVQ2dNSzN2dHU4ZjdNUUY0Y1hlMGxOV2hEOTYvaEhkbkhwWHhxeEtR?=
 =?utf-8?B?NkU0TjIvYXlSc2I3U3I2WU5PVWNsMnB6UmhUV3pGbncyMDh4ZFEyNHVSUENM?=
 =?utf-8?B?TEJSSjZuRHA1R3NGVkMyb21CaGdKaEVMMDJVOXBUSU5GMUh6dVJaUG96Mkxp?=
 =?utf-8?B?NmtpRmtFTlFpdHZtRkxXZlhBU3BrRDh6YkFmdHA4TlloNnUxMy91b1RMQTgy?=
 =?utf-8?B?dXZybGlrbm43dmFTWC83bXlERU9YeDV3eHVBNTRKemR1cUlGSlVVYkhkU2cw?=
 =?utf-8?B?S1l2TmhRY0s0QU5XUDhZQ1htL2dUdzFMVUJtTzJyQkZCL3BHWWw5S0JhUTF4?=
 =?utf-8?B?UnNXbmdjeENRVkhPUUpNQ2swZ1hJbzhCMlhqcWJ1cGxMOVE2enRseHVMNGt4?=
 =?utf-8?B?eTdMUS8vQ0NiMzNwTURWVzc2Yno0Z2ZWK1N5U0dzR0gxTXpQT3kremlwVnhV?=
 =?utf-8?B?UDVQekpiU01tamFjS1I4VjBFYkh3djlXVS9ZTHZIaDhiOEJiU0JvYU9TUHJI?=
 =?utf-8?B?TVIxT2IrTzdRY3BnYUcvbU5na0tuRE9JYXo2dzBaK0ZiL2VjWjlrL2lTUURr?=
 =?utf-8?B?WXNOZ0ViSGQ0c1Z2cVVsck1SRG94cVZuSW5lbG1adWZkamttbEVtck51ZlE0?=
 =?utf-8?B?NG9jQ2dRemV3NTV1emMyVTRjQ2dwNC9wbTJmTGZvVTliQzE2VU1rVkhDOWl4?=
 =?utf-8?B?aE90MlM3VlhnRHlYenpuMjluZllUbGM1bEMxbGdqY01SSnc2UUxUZlFoUVFV?=
 =?utf-8?B?Y0ppWm8vbGpVVE5ZTElraXFCUGVYclJIL0J3dHpPNzdYeHpFNmwyZmZMMWVj?=
 =?utf-8?B?NkEzZ3hqMkZQSk5jakZ0QTdwOURtYzV1bEE3Slhud3B0aU5wY2RsWkhSc2lB?=
 =?utf-8?B?a2JZemJ5eTNweVgrQ05iZ2hTZG1BMlhPcGoxTFlBbGYxSllJbkxFY3VpTFU0?=
 =?utf-8?B?NXNYa21OeWlUWnFEbmtkNEpTYkFtQS9NYXFPeUMzMzVwNzZOVlI2SC8yWk5n?=
 =?utf-8?B?SWRKTkdqTzBOK25KT0o0MkVjUjNQU0MwTFZONkg0VCsrUUNVSVdJU2ovYmpH?=
 =?utf-8?B?QmgrMzhJZlNra3VFR0lXZjEzTVd3Y2pIanNZUWRyKy9DWHI3TG1mT0Zkb0M4?=
 =?utf-8?B?bXZXdHdiNURtMU04azJoWFlYK1FiWDVHN0tMM0V4UlBHNE81UnZtQk1mWWww?=
 =?utf-8?B?V0NWNWprMDBLR0dZYWJtK0dzVFZybWZQcGFSbnpVeGVUa3pBRVBpQjA2ODRp?=
 =?utf-8?B?MlZDYzY2VE1VYjdUUG45YUNWdVlyQnBUNmFHWXAzc3RIbS9VYVhoRDhDWWtQ?=
 =?utf-8?B?a0h4SVZVMnI2T0VZQ0NreUxMekhDYmlIdDRRTksybXBTVmxmYUpxM3ZkNlFy?=
 =?utf-8?B?MjBvRG1GY21UYk90SlFHNVpvSzdZaFhRTEdGaWtOMVhMWG5ibFAwVFd0Q2d4?=
 =?utf-8?B?SVBYbFlEMWFpdmxuQnFLQ1JXbnUxcEVNblFaeEhhZFZUWUpkR010dHZscnBz?=
 =?utf-8?B?NzE1TjJpeE9vSkNWeE1wSkJrTElUOWhmcEZjVXAyZDQrdWRBUUFVbWVKTlVF?=
 =?utf-8?B?YVdYRWw2MzBCbytsUnlvY3JZOFFHREFIaGhtQkhoVnlkTWxocSsxbGxjVG96?=
 =?utf-8?B?bnF5YkM3S0JwOFZaWFN1cU5wSDJCSHB2VGlsSXgvVndnMWJGUmVJcGdJbDdT?=
 =?utf-8?B?RGNZMUdQNkNLaFd6ZW9jVXhBQ0V0RHNjRkVhTkxscjVNa1NHL3lVTUh0cnpE?=
 =?utf-8?B?SWR1Q2NJL3pmQjBIWGFKUHpLTWNqZ2ZzcmRNU3ZTVHhHWGdJNmJvSVNKN25k?=
 =?utf-8?B?WWMvYmJ4bmU4OGlqbXlDTTNuUVhNdGYyVWluSXRtZlhlSlJHRGh4Mm5kQzJ1?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abdde76-5536-4b9c-1e8e-08dd4f43dcc4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 11:11:44.3408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krLHOsPSRfF06OlMs3tlNUtf63Iw2aQetazn9l3rhS1MLlKlD9YJyUpVA2OMoYENk+RzTA+4PUh7OJVIOC7mdkFtho6rkx/urteTOBJeoDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 11:11:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6379

Hi Yoann,

On 2/12/25 12:47 AM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> Add mention of OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS to release-notes-5.2
> to users can use it after upgrading.

s/to/so/ ?

> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

