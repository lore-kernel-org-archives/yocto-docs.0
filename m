Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5A6EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 09:08:25 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web10.7142.1687424901858205786
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 02:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=VvtHnREF;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.49, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5W1tGJYGNGna7dxT1ekDSuEctae1m0p7bsSA3t2LgdL6trmPWlfn7eF8w5Xer2enFYCGZ+7qPjAee3Tr2k7y1cO5NZG07EuhYwklWrFuZDAO8Sr5F3gnz0x1Ke4kmXOaMcG9LTxHu9PTyDSthj3Mu+CfRfuWUGGGrfDWWBnkMxZ/ho6JGUNxy49YaKNC4YDG1CRaoMg42Z3wRuN2ilRnAnVm9GEHjE82URYBRfFBwgD/yPVQRqIfEU4eCAZ1/rzQ2X1f6huEIqTgzZgbM0a2Ax+xeKSxNAIWFXZZGjRiM5nHUr7dv0SxHLKsr9YKq+vZHIraTFYdfLHfdRKh3TetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O70ytZRcmPjLVLF4sb0g7D/JRLQ5oSeITfKmx+NUB6k=;
 b=jSosOq6FO2e+DFbkwJuk/KRywciRMWPYuNlVaXLUSntuL+2rD29yiFzXCPXwZ3eux3p6WV2Edo4bDZXHIGBSvTvy0Q/TtH9iueLXuxY/AYWRs2eBgGuOTb8xyGSVKEeiRpgvbxAMVUdbZveDrENCwZLu0AO5nrGfDnEvstsdJeOVZWk/LI7IVPzzb9eVlL1JUBrvHNedoYHoUNxtQCe4dHEcgsos6M49rVo24IJG1w6gXP5+iddEADP6FGd23JaVM7IKhrofBqWbTX3jsyGDByv1XpUiIgDAtwTgDD0Wde7pSoA8JSk5GVX4GIiGSXie+KRKD8JVwIoo/+n+EYsgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O70ytZRcmPjLVLF4sb0g7D/JRLQ5oSeITfKmx+NUB6k=;
 b=VvtHnREFlMwwmp5+SAU9j3O49jwPc07Dx1yzpSYLjiLv+xHtnNxYC+iIDDpkrZwHDR5HfJGo3sjrJ0uJ7UpkYtOWZ3V/3vEYSiP/lPRcpg83EX8vgUAZjAS7aSQ1HEm+hwOsS4o3e+SPrK7OIFGPJHLGd6d6Z9SugzmdMkXzJiD5MqJsLBu69tXULHYBCThTYYtwbc53rwsJZnME7xkAQPJ5/euyhkZdUz6tlSEs6nhJkWiP/yIpkL+jcDfcxR4og/FWhiIy2p/rKFum7Qr1YMTaTzuWvoU04bUcrRODyOtpDviWYsibEOhQaq8Oo6uufIJdsAOWDBmBquZxfCcsfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB8337.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 09:08:17 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb%3]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 09:08:17 +0000
Message-ID: <85e61da1-26b2-1f9e-2170-ba336b3e78c0@theobroma-systems.com>
Date: Thu, 22 Jun 2023 11:08:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [docs] Yocto Tasks Detailed Diagram Proposal
Content-Language: en-US
To: michael.opdenacker@bootlin.com,
 Bel Hadj Salem Talel <talel.hajsalem@sofia-technologies.com>
Cc: docs@lists.yoctoproject.org
References: <3u6w.1667236384580014962.DpiY@lists.yoctoproject.org>
 <898edb5f-3e7c-9763-c84f-6b59fb5daef6@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <898edb5f-3e7c-9763-c84f-6b59fb5daef6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: bf79cfbf-d152-4191-f485-08db73003763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h0vkJ+7hR6qAAW3mFe6CsvFTgufKuMCA339xhI46oJc3raTmQajasp8YtyRMUulegv0zWL3oqcOEYAGPYz95urGsQ2xUHu5l7+hu2l4TiAI8o8SB/IvgdMiHnFmZB80meEEBOYR1fuoGw3Vep3RFkJ8VeahGdtFJwL8UV3d+DQhQsSYiKA85vo8C0OKZA5JyOthyeJ9+Z9OPYloZ9hX7hLnkQErTxfI2uwavWKg+NX3SJqb0pk0Ky9zewq+94HObfOXrRYdRr68zpPyZD2EctKvpkzzk/ytT821xTfRb8KcaYBblKeucyjkD5Fyt5IM9dM9NMAfzfQ+EIYbn/R+nKAsy0vC6CtvtmazcpnC+rAzZqUeqtrgdxKwKZYPd5l0Wdw5yW9WWGmYXK9klV3skrtBSOv1FeApl8q3t/08aGAXCVlkXtBr0MfOZqcb+YlF71FTWatE5DChMoUMkwEhomXs+0QwvtLwRk/1vJ++rJftKHm1tAQ1AbEaeAeWy2DzU0kqugDVavzp4JFgGra/cKtecQkeFBEvuYHlZU1UTGiWQmbkBVe+27kuIH50v0hlrnYF1tJYKWor+etoCftLJpdAOuqL8/4efDilhV8m/qID8BP16/CQmTxaXyrMdm27yyQPewjvwQNYiGnU+W6wjdQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(451199021)(31686004)(2616005)(186003)(6512007)(53546011)(6506007)(66899021)(86362001)(31696002)(478600001)(966005)(45080400002)(6666004)(6486002)(36756003)(38100700002)(83380400001)(2906002)(66476007)(8676002)(66556008)(66946007)(8936002)(316002)(41300700001)(6916009)(4326008)(5660300002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VitnSVlDcUFya3lWNjQ5YlNaZHNBM1ljMUl5eXA3WlF6R2tLdG1GNi9SNjJ1?=
 =?utf-8?B?L24rK0hnUG1UdzNqMjg5ckVBM211ME9GdVp2Y25rbDlWclFGTlk0UnFteUMy?=
 =?utf-8?B?cTJPcXNHU0hGMjFHZDk1ZWtrcGdrMWRZejcveUFJbXk3eW5vR0JpT3dxODhC?=
 =?utf-8?B?QTBlOHVWWDhYYnZZN1RrWVZWKzVFOUlpZDRRWGg5VEpuZmN2UDZERWJzSXlE?=
 =?utf-8?B?a3FrQW1KQy93cjBTQk8vQ3BLWFhLVjNhWi83QXBaTUdlMm1VK3RBL2RGbk8z?=
 =?utf-8?B?QWNBQmZaQTBLQW01eGMxeGZvbWMyOUxLN0FGRVovYW50RXovUlVpZkpSRXhP?=
 =?utf-8?B?UEhLS0ZkbHU3S293V0lGS1U0c3VTenhZejRXcTlIY0tRU2t2emVsYkJ6c292?=
 =?utf-8?B?cjhKbS9JN3BSbGZVVlB1dWNKRDBIQ1A5ZDBybllhc0FVUDdTTm1ibmlXRU1j?=
 =?utf-8?B?ckY4U0VpbXNZelJBcVRhZllKeXFWbFpWcmp4cUJlTHNUdU5LMzlKM0hUT2hB?=
 =?utf-8?B?c3JFMkpLQ3owMVVFUVhHQ3lZQXJ3VzNBbHM0Y3cvRnBwWEtlNFUwejVDTGJV?=
 =?utf-8?B?eHJsd09PamFjdG1ITkZuWHA2UlBpTm1ON3NJMVdrWkVNUFRHaHIwengvN29y?=
 =?utf-8?B?SXM1SGxFSFdjZXpBcFhJcGVxTnI1NUhYRkxCWlpZcENXLzlPVlE2cCtUcDhs?=
 =?utf-8?B?NlFvL2MyeHRlRFhvb2lJWEg0cFJydjhWQTFyR09zMEM3VytIZlprckxncERi?=
 =?utf-8?B?UzZGNTlka2t1Vms1OE0vQTk4UjFrTW02cm11VDRBZ0FHTnU2ODBpaDFTQXJC?=
 =?utf-8?B?YVUxYWY2K1cwOWR5dFl6S29wQXRyNis4blltSGxEcTh0RG1HUG90WnVUN0xE?=
 =?utf-8?B?OVVQRTJCdFVMNXF6NFJBMFFXNk9pT0Zjb3BSSVdPRGYrRkFzdjJ2RlFXOWRt?=
 =?utf-8?B?dWF2K1JQbkhleitNVjRzOVcwWHlmSTRSQ3pQYlErOFpWZVp4cVJzNENDeG1n?=
 =?utf-8?B?MVhpMnRpNzAxc0V2d1RBSURmRTNrbXJSU0dyQmlGWmlvOHdtcXVHZ2p4Wlpi?=
 =?utf-8?B?dy8wKzRkR25ISGdQL2hxSVJjMEtOTXVJcVlKcEFZZSs2M090SjRmYXE4ZmdH?=
 =?utf-8?B?OGs0ZEMrTFBzVWlkOWRtS3N1NHhtUE44MFAyRVlIUStiUXNsUFl3czVFaEg2?=
 =?utf-8?B?c3czeXY2UE05OE5YSnNrc3lDbG9haUNvbDd1bGVxRkpKUWxxdkk0em5HYmNu?=
 =?utf-8?B?Zk9HM2NsRHRBSm5IUmpuQjViSjkzbFU2a2xPSml1VkgvTEJrcVJmNVBMcmw4?=
 =?utf-8?B?bEdCN2lDaTZnNkRSL0g5M0pabk9hU0Jqc0l1Wm11MGZWVXcvOUdGR0pnMzZK?=
 =?utf-8?B?SEw4NWR2OWNwUGFxbkZGcC95UkRTaHlhZXM4dTF4MzZ3d1ZDS256UGk4OWVm?=
 =?utf-8?B?ZGh4ZzI3dHFra05jTGlEMC9yVU9pTmFEelVzZXlnSjJpbTRQSjBSYUcwWnpz?=
 =?utf-8?B?d0JUeCtkMGl6cmlVNSttaE9nbFg2aFkzWTRKK0kwT2pvKzlTR0Znam91QlpX?=
 =?utf-8?B?dmFkeVN0cGc1WjVvUjRtejluMDBVSjk5ODlvWHVjMk5iaTdiNVFBdENBOWg4?=
 =?utf-8?B?NFpuRC9yRnM4TEFQd3FiZjBhMXhubHdyVDI1aHEwZnh2dzI0dFRQQ3BtcGVk?=
 =?utf-8?B?U3hnTzlvcjY5Mng0SFNQSzJteG5nMVh1bHBGdHp3MmhnVnRMZzFYTVhvTEZv?=
 =?utf-8?B?N2M3WEU3UEc1UDZvaXkrbVNEZDdDbllCZkZkMWVkMnJVZGxQWnZ3dHlaZ1B4?=
 =?utf-8?B?cUsvR3dFc3YwZnNwU3ZISzhXT2xyWmR5eC9veStPOGMrcHpuelhIRFJmTFA2?=
 =?utf-8?B?UEJYYUJvT0dPdGVDU0pWYzdvY3dkc25xd1lJTE5KbFNjTHNuNFFrUnpZY1ZD?=
 =?utf-8?B?clNZdGNUc3FaSmZyN0VnRFBDZkY4ZlUyT0VjalZ0QVdvVjZFMmxiaWxsTlpQ?=
 =?utf-8?B?djJ2QkYyNnY5Q0tRSWZlcjNiNGI1WXRidkpmQnlIdzlSR2hZOURjSUFFcmNV?=
 =?utf-8?B?eFJhYlhldTA4YW9heVNJNEFlMWlnSFhXbG5GZFM3bFRzK0pvS1FjWEpjcXF3?=
 =?utf-8?B?ZTlUdUh4WDkzZXBsWmdkK3Vod3dpQ0ZZTnIrM2ZsRE9mUThMWWhhQWxiWXRm?=
 =?utf-8?B?YlNaSVFtVmptYWlNVkhGVEVDZU42YTlzL0FROVhhcmpSOUNQWXpaaFpZNFYw?=
 =?utf-8?B?NkttNUthaFVrdDRSOHRMa3pZMXNnPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf79cfbf-d152-4191-f485-08db73003763
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 09:08:17.1940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +h3ews4Y4I3YKOqFMWqVkLBiJchOuoJEP2lPLRkw1eFNtzfDYbMgemvmk1O2P+WFkEDTNx7LGIEerYD5j/DYwjOibpIxst5s/r5ddIkezNN/6Nykrl7X5uZ0OiLwiyWw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8337
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 09:08:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4020

Hi Talel, Michael,

On 11/1/22 16:42, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Talel
> 
> On 10/31/22 18:13, Bel Hadj Salem Talel wrote:
>> Hello All,
>>
>> I did create a detailed diagram about Yocto Tasks and where they 
>> happen exactly in tmp, downloads and other directories in the build 
>> folder.
>>
>> Please find attached the SVG diagram.
>>
>> If it can be added to Yocto documentation it would be great, so any 
>> comments/reviews are welcome.
>>
>> This will setup the way for me to add more detailed diragrams about 
>> other Yocto topics.
> 
> 

I've seen you've continued to post a few things here and there on 
LinkedIn too, nice :)

Thanks for suggesting using this SVG and sorry for the time it took for 
me to go through my mail backlog...

> Many thanks for proposing this contribution!
> Before we find a place in the manual where we could use it, I've got an 

I don't know yet where we could put this SVG, do you have any suggestion?

> issue with the text labels, which Google docs turned into shapes when 
> you exported to SVG, removing the possibility to edit them in the future.
> 
> Ultimately, I'd like this diagram to be maintained in SVG format, so 
> that everyone can easily maintain them, typically using Inkscape.
> 
> Maybe we can manually edit this SVG document to fix this, replacing the 
> shapes by real text, which could be rather quick.
> 

Agreed on editable SVGs.

On the SVG itself, it's a bit dense so I needed a few minutes to look at 
everything and understand how the things were working together. Maybe 
there's something we can do to improve this but I have nothing to 
suggest at the moment sorry. It could help to have a small explanation 
(either in the SVG itself or as a caption in rST) as to what this is 
supposed to represent or in which scenario this would be a diagram I 
would like to look at to understand some things better.

However, "Same as image" under the sysroot-destdir is an incorrect 
statement as it's a subset of the image directory, controlled by 
SYSROOT_DIRS variable, c.f. 
https://docs.yoctoproject.org/ref-manual/variables.html#term-SYSROOT_DIRS. 
It happens that SYSROOT_DIRS lists most common directories that would be 
useful for other recipes but it's not always the case (e.g. passing some 
U-Boot binaries for example, typically located in /boot).

Thanks for taking the time to share this with us.

Cheers,
Quentin

