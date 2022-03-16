Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C59C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:31:24 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.42])
 by mx.groups.io with SMTP id smtpd.web11.25875.1647441083455974218
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 07:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=fm1ffMSK;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.42,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkQkKfjD1S1qPfbtCbqfaHvv0z5+6QeQgpKJvQ+v8v+/NonbYA4i5Smcai1X+UJ5GwKoN8LoQrUxQ8V659PkK4CYZvdTnwMVmMFmiw8dBHa23RHRftJQI/UdsRhFQzeYjRmpzYBDyt3D41/t9J7jZMR8N1UsGtO53B10l1j7L1lTICMdGa6ymJXpeY6X61D2p0NycwepYU5MOoaBsKEXOkc+AQrRL6LchF0NSwqQaBbN3HQqNkvnkCzrHFeYjF51k+91PAdSsaeW/TaGN9lNFSREzMtBa4nnn/Moj/Nd+rEeySe+p8IiZio3fKyvDisiIHiTu7lEUPIo5UQ1ECA/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRKR63nAvHovQXGDmUlHK7HZl5yaCyQ+025aEYVn1tM=;
 b=Uz+rr17M9L1vrk/tqKfTc6YYhoMfD2Q6qWxPX9W0JmxA0kQ/yrEDqLmpdW426iXxdw2xLszgQ+OhCP4oTk1RoTSudK+tFwAGPCgnT9os0tRmThZtf623Go2sAYetABZ2UHhuGHmF4PAMC0VJbEWVfuixCnYSM2tMqlKADcJ/9kNRUu6WKju/golRlUyPEdiI6knGcoebIk0TEpZP85EDQkMoTwr4b1GTX8Nkn/uHcAtjdZfUqnGukPlnYhQ+BNDrO/hahjy35ZuhwzJ9JEe6imj14GErq5oWOSbw79gPARKOkt1GcMueqHWnngOqyVWWjrAI7q2nR8lHRJTPYT14YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRKR63nAvHovQXGDmUlHK7HZl5yaCyQ+025aEYVn1tM=;
 b=fm1ffMSKRRBKXLeCQuy8h5w3XQjGT4npoPJ8xcPiMrfQvcmUYYFA6jvYCJzASYfF4q8bpe7RlXCYKkXwm8Ejqa3k8rV+fXDQow/fLzYPrCw723fpNyShNvHJgIZGdSI4xN58uFqjGGuruKwuv46KI2CFCVKKzoxB/z9KX1zWJZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by HE1PR0401MB2313.eurprd04.prod.outlook.com (2603:10a6:3:22::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 14:31:19 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%6]) with mapi id 15.20.5061.026; Wed, 16 Mar 2022
 14:31:18 +0000
Message-ID: <8f79daa1-4cd6-f958-e0fb-7ce04fcc0a13@theobroma-systems.com>
Date: Wed, 16 Mar 2022 15:31:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [docs] [PATCH] doc: migration-3.5: variable changes for inclusive
 language
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220316141643.185590-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220316141643.185590-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0018.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::30) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04be1173-2336-4e3d-3cb8-08da0759a299
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2313:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0401MB231394FC33A4D954F6DAC4EAC2119@HE1PR0401MB2313.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xi165wILmr+LURGzcJx2LqYt+ITlFWxvxMUmwgeu7xMmbMz1YgSfxVxw0z2yaV+GVPCF+7FbN14rBdFBOT0Ho+2VuSJS5tkusHC8v3BoePWXi8jVT3R8dgN3a4phIuvUhOe5ZMMffmHOLrhY1uilqpCn38OZmBE2IYaaBG9en3S4g0X+J7XqPnDgtq5wiF1rfKTl9BafXhr/IK6aGh6mYdGTep3/dT613MfLzsGbRCf8VkSn1Tynzbyx2rXhyy9mo3V4bxu0HPWpF5uN4mKyM91dWwnOfibON6AQdKBeekjONq0yCW+DYmNEh1qeoKXS7nVRJ3Dcj0sEQA28Xh8JrE+60Hp46vPCVyGvCeSkwCoQCnuRWnjI0XZjMeZQKYtgw8qfrYiTtA+9lce9l5CFVGb6/pMyxXRyJRKBYtweNRpKLYV92FgDHS2gCuo83ZQJ4DOYu9YyJ7smc9HqVbGGRyhrmUU66ANjI1G+utyODg/+XMoo+UyNM138Jh3zroQWf6E4cWYb80JDKu8FvzQg3k8K+etQN6OfkGqb3k85V3ey7Uv2JzLAyFCW30xRe5nGLTAXY3076TUUhbQ1VkD8PTkiKvieK37jzFFsg58OTbxW4XkAAmihTu3Icdx4697jK7afLv0wlnELy4BVP+ITSCgOlUWKIJnx4SLwBVkGM5M/6oa42oSYcWL0bx3GSh7l8W9q4spWglLy1MxVp49oVK9+klCRm6i0alOLe+SE/DqbFDdIUOaWmxHOXjyfMNXKZdSXhFh8HCwQf7BxUmi3orJXLNF4xHp56rLa0chPRO06xbyl9kEeupfKx6GyTuhGfmpsZx5qpJzttb3R/7lr+2HhWyPvo9NyWWiHCIm4Kyo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6666004)(53546011)(86362001)(31696002)(186003)(44832011)(8936002)(83380400001)(38100700002)(6512007)(508600001)(2616005)(66476007)(8676002)(66556008)(36756003)(66946007)(2906002)(966005)(5660300002)(316002)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWQrSThySGEra2xzalEvL2k2U1JZUFUzWUdaVzZWRU02SVVaK29UU1hpU0sy?=
 =?utf-8?B?Z0dnKzBsc1FzSWprMGI5aHd0RWNjRmV3MWJEN0V3QmpMTHhmL3Nnamt2TG56?=
 =?utf-8?B?Vm9RNnBIUmQ3MEpNSXloWis1UmR4ZFkwR1NVSmxyS2gzdHhvYUNnYWUwNXZF?=
 =?utf-8?B?UTZaZlhITnFza3NTVWdMamxjY3N5UUZrTUNkelI4SThTYmlGRDdxQXlTNldl?=
 =?utf-8?B?SVg5emtPdWc2RVBiRnVrdnNKYk5oeTIzcFlkMUFPNUNEVkcwK2FLc05PWWh2?=
 =?utf-8?B?MFRpaEdKOGNXUVJWZFRnOFNGVmxoaU5VcW90c0ZFdVZISkpnUCt6K1NpekFR?=
 =?utf-8?B?TjVYQ2RVS3NEVHhvTS9lNVd5YXYzU21ONTRXc3diU3BQVm81TmpoMmJqMlc0?=
 =?utf-8?B?MnlhVnU1TXF1SkFBQ1Q3bUdQOHRINWxrZWEvUjJCRGtzYVhWQVp3TDdSUDNt?=
 =?utf-8?B?d3poMkVsY0J3bjBXcnRxNk43clpQVWMyVHh5dnI4Y1duNXliU3g2WFAydzhh?=
 =?utf-8?B?QzFzZnRXRTdZdWhQWHJEa2lDU0pKZkd5QkVRT3kwaW9TUXZKUTZ4UlB5anBH?=
 =?utf-8?B?REhTbkh5Ykl5UHNhN0dMWDhmZHNIWFRxNlhXK3gxVSttVUxEbklrTmpVWDFy?=
 =?utf-8?B?TFpGbjJkWFhlQXBmK3dVMTAwYnZtWW9lUjBJTzdPYnFJckthci9UTmlHV1kw?=
 =?utf-8?B?ZVNqWlVCY0hJeXhxM0d5cEN6ZHZEeERSdTF4VjhOY2lMbzFvQUVwOGdjcE52?=
 =?utf-8?B?Z0RUSEJ2bFh0cnYrTDBpVmZlOG9lS3BEQ2Zpbm5IMXJOVVQwY3k4YTlYT1Z6?=
 =?utf-8?B?Z3lHKy9FYkJvZEw5aW93Nm1IQjN5SFRWSWtzWkZ0bXNYYXZ3aWlmUHR4Z1Jr?=
 =?utf-8?B?T2JwWW1GVTNWL0xSR1huWmRpVS9oY0Q1cU9LTTZaMEpkOGsxNlNlTjdGZita?=
 =?utf-8?B?dFlNam9HeE9jRThmSnRGR1pwRW0vZ3dmUVFxanRTS0M3SkNyUXNOQ0VORUR2?=
 =?utf-8?B?UW1RWndxQ1lVK0JNVW9vUG8xbTQ1ZGlpSG5JUGdDVGg0UWlac3dIWG91MUhp?=
 =?utf-8?B?c2IxbEt3ZHVpRittQURXVTY3bGVMZmhzVW15OExocTJhcXpRRXdRNDlpWmk0?=
 =?utf-8?B?NHhjUExyR1B6ZFRnay9IWGJpa0hXUEYrRVhvMGZOSjFrTkpUeHVLeWJlN1Vx?=
 =?utf-8?B?d29VbTZlTExhR0FLQ3VETHBIclZ5ZkVoSFBpV3RON0JGUnNBaEZDaVFncTF6?=
 =?utf-8?B?Q3ZNdVNkRVptZC9CRDZ2SWNkM2VLWmpSRS84cXlnNXg3YXFZYjdBR0lLSHA4?=
 =?utf-8?B?TE1WNEYvTkpXaitVS2xMaVNVUysxTWthLzBwamhvUWd6WmhhRTdlcVo3U0J0?=
 =?utf-8?B?Zyt0RGpHYkViVk5sZEFvVENNejdmSVhWTzZMNWErR2NOZUJ1WWpra2xqbVow?=
 =?utf-8?B?QmxXZVd6ZWJHaE40akNQaW1ncU8vZVVZUDNlWVpXNExrRk9ib2RBSlY0NWp6?=
 =?utf-8?B?MFlMd2ZqK3FMS1U4KzlRK3NJN3QyZnJNdE1JWURPd2g5OE9BWlZ2M3NEMHRX?=
 =?utf-8?B?SnZOdDBPakdCNzh0dDZuaGU2TFp0NUI5V0tOWC9rTEhBS1hnTXZqemU4dkhk?=
 =?utf-8?B?RUNRNXc1aDBIZE5oSTRhM2c0bVYvT1dZb3FDNjhySHFOeERLd0x6MlBzWFNU?=
 =?utf-8?B?Mkx4UktleGhQQ3NaZlpiQTJxN0hNOW5mQ2xuTVltV2VwTjc3Z2UzMWUwZEdO?=
 =?utf-8?B?UWdxQTZUaU53dkxUSXQveFlIWUNVNERaR3dVdmI5OUNEZHhqOG5oOHRwdDdI?=
 =?utf-8?B?TTVOWCszVTNVbjJUbHQ2QUdUTXQxa3pZazkxcjJ1ZzQ5T0NZVEYwb3ppd0lk?=
 =?utf-8?B?RmdXNTJhNUxIVENkbExheTk4UThLczRGa3RMVkgxZHdjMFgxc3A4VWw5NWFS?=
 =?utf-8?B?OEJPZHlYczFWWWtQYlpPdUZIQmhZa3k2K2RTZklpQ2kxb2FjVXE2VlRoV1lT?=
 =?utf-8?B?bjhGdWlsdllBSkZjcTY2U1JPTXdNTWQxcC9RbUpVb21VRjNndFcwb2J5MTFE?=
 =?utf-8?B?aE9DcEVJVjlyRWVMT2p4MWRoV01kODlXTUxsUT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 04be1173-2336-4e3d-3cb8-08da0759a299
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 14:31:18.9187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gAOv+Ay96dpC7wcte+21UAtgseB5m6Fu81zQvnCBolz5NnbAxkWdygvdWzbPuivYGZgLaWABNpwEcfPD6o2u5LjAzulqmjAe82EoztBQ6bJusXgkKPGA3BQzVd+7pWTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2313
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 14:31:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2611

Hi Michael,

On 3/16/22 15:16, Michael Opdenacker via lists.yoctoproject.org wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/migration-guides/migration-3.5.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
> index da09b6f449..b4816b8171 100644
> --- a/documentation/migration-guides/migration-3.5.rst
> +++ b/documentation/migration-guides/migration-3.5.rst
> @@ -7,6 +7,17 @@ Project 3.5 Release (codename "kirkstone") from the prior release.
>   Recipe changes
>   --------------
>   
> +- To use more `inclusive language <https://urldefense.proofpoint.com/v2/url?u=https-3A__inclusivenaming.org_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NZHda3CsbFlho8rTtHcrMeiFe-g4jkzlkRdaW4WJI0MhJ8URYdm4Shoyre2YH9Op&s=6dTdPTNx2AZlcQ8zt1bgh2nA8Ksnbem3BvlytLGcxew&e= >`__
> +  in the code and documentation, some variable have been renamed or even

s/variable/variables/

> +  deleted. BitBake will stop with an error when renamed or removed variables
> +  still exist in your recipes or configuration.
> +
> +  An :oe_git:`convert-variable-renames.py
> +  </openembedded-core/tree/scripts/contrib/convert-variable-renames.py>`
> +  script is provided to convert your recipes and configuration,
> +  and also warn you about the uses of problematic words such as "blacklist",

s/warn/warns/

s/uses/use/

Maybe we should abstain from mentioning the words that are problematic 
where we can avoid :) Obviously the list of renamed variables is/will be 
added below but there's nothing we can do about those.

Cheers,
Quentin

> +  "whitelist" and "abort".
> +
>   - Because of the uncertainty in future default branch names in git repositories,
>     it is now required to add a branch name to all URLs described
>     by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For example::
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2609): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2609&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NZHda3CsbFlho8rTtHcrMeiFe-g4jkzlkRdaW4WJI0MhJ8URYdm4Shoyre2YH9Op&s=5dxLeJLJCmMjBoayObb6Juk7A9GQ8clUc225eFMwNX8&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_89822588_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NZHda3CsbFlho8rTtHcrMeiFe-g4jkzlkRdaW4WJI0MhJ8URYdm4Shoyre2YH9Op&s=-odKrM0laseF4Q_3AqUDw4V1ZBGV9YjYQb6Q24Zhrqg&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NZHda3CsbFlho8rTtHcrMeiFe-g4jkzlkRdaW4WJI0MhJ8URYdm4Shoyre2YH9Op&s=k_btoQfWSbNUgUsK02f9kjguOFH8lgOAVZOwb3KBP0Q&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

