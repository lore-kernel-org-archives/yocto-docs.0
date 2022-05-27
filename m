Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBFBC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 08:59:47 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web09.1557.1653641984952765096
 for <docs@lists.yoctoproject.org>;
 Fri, 27 May 2022 01:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=a+BbbO+v;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.78,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmNnXaPjlLqJ3g5D+mZIAGVDrjOFkDWZL91MDqbED1vf2TJWPYNOa3VVWXSnjbzGZaYj4+Mju7chyvlbpxz44eRHoTGCBuXhSiT90wJdnbLxmUgnuyUBOPjLxPqwqqMCBYXWlJWLNBE2lxv6U3rxKeTpyETS4v9JWaGD8J5VPry42iWivEDkJzbChEsGO65VJRl9fwRNYRT4QBltnbGkXFAKeKRrkDjXgaUkT4rLfdNNXuyqifSOfTud6hfYokkymDaBMRNK4Eypx+0KKHxXeyg0/gkIuDyCCW0afh/4EeOvLhFkY3j+scqoPY7dVfT3KOibwfYFm2RiaGxf5j5Bkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8LsHgjv10ios1duWo2fSleenBbZkK0gY/sEXgT5th4=;
 b=WuS6RVwZyh+SgigD0QCCL2x67jDeXhuvo8pr5+uQCjHn5Jm3kpWuYqKCBaWRJgAa6WBr7TOzpkAb5T9K8zyZwqthfK6AKXvx6sdg1T6cYUeUtIEG5oq/61yCNAfu2nHtBQ1BPwEHlap9ehyoo/lzbWYByZNW3xRWieGax7vLLVgjvwYdFFtTj3kfCRkdZFexZGuc+kdE76BSb44nTp9VabQ7BJ6Mz7GNWmIsffk26n6TUsyDs5273ocvHpkQiNTYpuN5XzYaLSDe/ecV/I1n1I2YWvGpNXNPdXvS+dHRWLuQUDVMp8D+gmyg5ipnGqKSDHm7P5eCR9OJqqixuyXNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8LsHgjv10ios1duWo2fSleenBbZkK0gY/sEXgT5th4=;
 b=a+BbbO+vj0BXZZcWUSh1fiiHksWsLkFq70ufdbIWQZ2/uLaG9jBKO4K2r1Uy4g2/cP1tw7TZseNVI7T5ut6PdQ7w9rlDu/Xlad4B//sqkX45bjpry1a5WFNGgPQzT7epY4daW3KxplyakcCPWWLzA84NbC7Icjw849YToxtd9Rk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VE1PR04MB7357.eurprd04.prod.outlook.com (2603:10a6:800:1ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 08:59:41 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%5]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 08:59:41 +0000
Message-ID: <7c0f218e-8673-9f7a-6751-a44c739e6f66@theobroma-systems.com>
Date: Fri, 27 May 2022 10:59:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [docs] [PATCH 1/2] test-manual/intro: reorder bitbake-selftest
 steps
Content-Language: en-US
To: Zach Welch <zach@mandolincreek.net>, docs@lists.yoctoproject.org
Cc: Zachary T Welch <zach@aquabyte.ai>
References: <20220526151228.562281-1-zach@aquabyte.ai>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220526151228.562281-1-zach@aquabyte.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6db6693-bf03-48d8-d68b-08da3fbf3c62
X-MS-TrafficTypeDiagnostic: VE1PR04MB7357:EE_
X-Microsoft-Antispam-PRVS: 
	<VE1PR04MB7357A74ABA51F9AB5761BFB2C2D89@VE1PR04MB7357.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lo+k/MLsaSC15glu6/LKUQhojR9mNlXV7Fi9Ehkgt+rv8NbhPgExh9rza+MQAfoVmFRjd8KSwQtZP6rQzPNgGvDCtQlPhlkquUhCm0ciQD+s80NR+qY8Q2LY0giFTJdMq4XaIZPVgJy19Fl3nQM4NN5+k1SEVxAJPjXNwhZu7RrtdHu9TQVs86P8s06B50LSTRbtenYD8qTjfLzo3j8NcYNQkDwf8axF4lMaeEmyg9QQn+b1P8EB3BgjOPzebKKxaPZrMzcSeA289WrxE0lwBI0AnM7mgHwWRmM6N5CGKOQSaA5LGH90vA72bS9+4aXX/aKWw+QJ3BpzA5oSsC9gt/SPsNLvgoWnsHcoh90ERACcbPhrI+bLdBR+ANj1lZHBC1DkC5WM0MxtoJR0NBX6zNhsWk0APhqtYuvIcI7HRXSHXmuhZGX5WRLz4fHUgCu87dJ8QmglnMamW+QHYISUUz/JGvavIe97Rq3ZQHKNa9s64wNGuuqsEh2RjvxQwG0qJZ7sTemlKYSV8EJLIefJs0OuJK3F55A4SmN/BvVc7SyBj+k7tQUZzQR/i5pw4MCkgu1T/3ZrM+OLjRnT/QSfYflZ5jZC3sz3ZRNA7yemmRg3kpyBJ0B7h6GixpTUYpBGcu+a7zm/ALD6578Z/7NfMarJCeC/bzozYKvy20WyzstwGZFCWKf8//fYHMFtH95kYn04Tlhh9Z+uvpzrCjl2SBKzxOERSQzqLRvUNcbrUFU+K4xNHaSEcrTB1XZacs99
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(186003)(8676002)(38100700002)(66946007)(66476007)(316002)(66556008)(2616005)(5660300002)(86362001)(31686004)(44832011)(558084003)(26005)(53546011)(6506007)(6512007)(31696002)(2906002)(508600001)(6486002)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFIyUEhQRW1xTEFQR2lQTXU5NlFsY09ZaGMwRkU5V3FGSU43VEJpc2Z4NzFa?=
 =?utf-8?B?ZWtiOXpNcnpvM2syNS9FcGsyYnRxam5oTzMrK0tZZkkyOEFtS3dxVlRxNFVi?=
 =?utf-8?B?YW1WOWNNMlVDM1dnbnhickczNVV1Zk5Hb0JuNmZ2SDFZa1JXdG9oQU82b1Rs?=
 =?utf-8?B?ejVNQXpHTnJMa25SaVByQUVYVHNpdUF4Nnl6czQ2RGJpTE5wRGducC9zc1VL?=
 =?utf-8?B?b2p0eUFRbGMyVjBEbm1DZS8wZlJNa1RtQnRVUGpXcUFHYmhaVEZQR2xXU1JZ?=
 =?utf-8?B?eW5rSG1BOEVGcTdSZVJvcmtlZE1xZTJXdjJadnBON1NON1MrZ0Z3Y2lyRzNL?=
 =?utf-8?B?azUrQzROUjR2WFVSSktUaHdXOEtxaW14L0wyQjFBRG5JUjhjK3FoWTJEYysr?=
 =?utf-8?B?bURHZmNFMkxDb05KdHNyVyt1dnBzMkFRWlo0WTlqSHQ5Yi9ZSlVXNndxb1JB?=
 =?utf-8?B?NTdlcm0zdTJYblVDR2VjNlJZcVk2bU4wbi8rR2ozTktpblFXeDRuV1RxQjY3?=
 =?utf-8?B?a09LU0VkUzJJZlo0UURTMFV5c09sbHJ1WlpMcnFwdzc0a0kvUFRvdGpkTXFo?=
 =?utf-8?B?TWt4a2NHRmsrekRBVzFwaHcxTmR0TXF3MjFGUWc0aEx2UUFNN1ZFNHg0R2Q5?=
 =?utf-8?B?aDh4T2l5d3RQdWpVTzcxZ1Rhblh0T0VoaGJnZVJVQ3NpSkxtQzlkL0EzMm8v?=
 =?utf-8?B?eXFPTUg1Z0E0RCs2LzQyUTVTSVRaSmxWNTJwbEVkRDNOUTNvTGZhVjFLWlFM?=
 =?utf-8?B?NzJGaEQzYUl1UkphM0VwNXh6Mkw1N3UyblR5emdwTVZsM1dESmFVSXcwRjdE?=
 =?utf-8?B?aitldXJHWnhFa29ocXF5VjVNSHNHUVMyQlRYc3NtNHBpYi9nb0t0ZklpOUdI?=
 =?utf-8?B?cVlvZStrR0F0OThmWmNmelRvNnRVM2kwWCtsUkxSQjhqVTJOTEl4T1g1cmZK?=
 =?utf-8?B?bUZDSUsxVHQvV0ZaOHROSmdEQzh3OVpDclk2RlB0RVkySmdQSnZ3SU9PRzhL?=
 =?utf-8?B?SEJCbnhZR1JXeGN5STVncnNOL09hNHRROHhPV2lUSDdBWmlGeVU3ZnNFb09X?=
 =?utf-8?B?UnJ0dkpwSE9xM243NDVwL2xqZjc2SktmbU5sU2RCQnlUaUxOUHBUZ1ZjNVRJ?=
 =?utf-8?B?VFoveDJJNnFvQmtmVkhiREZpT2pLUnhPS0dNWWdZWnlpQlNNY29tK1owWHJs?=
 =?utf-8?B?VXpENnk3Y25RMXAxRm1kYVNRQ01lUHZrd3FHeHB4dVIwQmpZZ01UTXdWTFZO?=
 =?utf-8?B?NGh2aGx3R2U3RVBxSWJRTmJGcVMrakc3dVpNRjFoUEFiaEljdmE4WldkYzBX?=
 =?utf-8?B?NzJaV1VvQW5GczlRQ09XVzlHZVloN1dITndNRkswOVpreTlNS05wbnB2WTlS?=
 =?utf-8?B?dWRoWGh0QWRSOFNqM3pOTWtCemh5Skh1alFJaUVpdWVERVUxbVpVY1pDNW9p?=
 =?utf-8?B?QTdtL0tqVjFlcFVzN0Y2WXBocDd5WmRheXNsMVRFd21iTkNEeGlDb3daVU8v?=
 =?utf-8?B?RmZvQ2psOFVmeVBxZEZYeDJlK3lyTTJKejlJZnlKRkpiQmphTjFDN0dNN0hH?=
 =?utf-8?B?RXJKNGpZYXBpcTU5MUptcTV6MFRuemFUaHVERkZaOE1vbC9QQm9WZFRmb01C?=
 =?utf-8?B?WVVmM3l4eFRGdkhmRDQ4eU5rem5PL1g0UFJFcm1kVzAvZTNWOUZkUDhmTWw4?=
 =?utf-8?B?dWhsNGdYcE9mRmhlT2hiM1N0TnVib3l1SWI0ZlZmWWFHV2Zjdmt4Mk5uU0hl?=
 =?utf-8?B?U3ppOHY0UXdGWWMwT3pqdGEzL0hCQXJmMnlza09VL1k4SWxZNFN1RUxOWnYr?=
 =?utf-8?B?YmFyMEt3dEZDVU8zUlo0bW40UXRNQTVUYUo3L0VYVXp0MEVkZm5CSmN4djVF?=
 =?utf-8?B?N1RJcEppeHh1TUJzcmRxL2FKYWlWbCtEMDhacVYwbFdjSnlLTDdxeHRaUWRQ?=
 =?utf-8?B?QVBPRXkrRCsrRXZ4ck82eUlrRHJMTUVFaXd1ZHVLSWRxTElic0tlN0V5bVVo?=
 =?utf-8?B?cSt3cUJncE05NVcwVDlqbnJ4MUFDTXcreFppbnBQc3A3OURDVWFGYXRDTG5h?=
 =?utf-8?B?OHFvU0NsZTJ5eUlYN3BkbVI0NmdFTFEwb0MwZ1JneWl2bTRkSVE3NkFwSWR1?=
 =?utf-8?B?NWJ0SXAxelA2SnJMOUpjdUdNQ3pQMTM3WUZxTkV4U2lPNDRoSk02L1RXRFJi?=
 =?utf-8?B?QlMzYnFZT0d2RmhXYTF2Ri9FNGpSenNoRDd1d2dyVkpFcnVhcVVuOEhIWUJx?=
 =?utf-8?B?b3licThXTUNQNVFXY1hMbThlVms5YVJGcGhCaG5YdnB0V01KSVJBVzhyTTFr?=
 =?utf-8?B?VDhYZlFhRll3MmlXNzNacVdxYUJROFhwZVdMSXk5Wk0rQk9QTWV3cUp4VG9l?=
 =?utf-8?Q?alF8y+pvzNZyu3dR+kin3W9mk9dMXc08vq/O7?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a6db6693-bf03-48d8-d68b-08da3fbf3c62
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 08:59:41.1946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CWeFErINHeTyuzZqHQcPSJ0doNbFPp/lq1Gm/j1MZemrKC4zHroFebEej+S/4YqC9DRH9+S5q5UlJM3H4AwYVKeLc1tX5xbXJTtnJb+la+bQDCxdnBlqz5ZNzom9OapD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7357
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 May 2022 08:59:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2950

Hi Zach,

On 5/26/22 17:12, Zach Welch wrote:
> The addition of the verbose example interrupted the description of the
> BB_SKIP_NETTESTS option.
> 
> Signed-off-by: Zachary T Welch <zach@aquabyte.ai>

Looks good to me,
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

