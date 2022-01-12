Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CCFC433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 14:31:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web11.23961.1641997911556657828
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 06:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=X2zzJHr/;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.86,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUR68fKOIgHuiP5BlqVEOL3L4ktc1/KPwhWXVxPJXgPf7T7ycWVRYPVEjyj4P/qNjpMh378Eb/QQviGoLz3xcOqhZqvFqtVz7xKlu8138qDUsuQXFIeQmr0lNYXorcbgFxAM0agQhJsGdTQjA33f/SSH9+uIQYqLR3PUyiEjy8mBYtuUosYK5XNihSL/yiaWZoO2en/HnOmpdaSNL5JgT55zTwVxL/JGBww1gdeWx8Duq9WPfpOLdWb2xHbMv9GHRn+1IbSni1fmuLxdVoKg4fts5hN3Suj4GDaAtgCcuEqPjzn2EVun+lRgR3wXsUQifSTmYCpfBSss01gIKlxNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gj5B81HFuDczKdS8xgddyzcYTOh6KbxnukmwxS8x+dQ=;
 b=Sp0gAqbA+S1njkhDSf1zpg6PB2f8KYH5mJM78Zp0TzyYHHjozIusr3wfMxYgZLSUiNqAM+wG32P7IYhh5hMkzSUQCDiQb1S2sZN4XjXgRbsoEzFq0b/ijYGqrxpnUIIlkGDA+7Z0eI1kLi3Y0Sznk69XyuIOhbxt3qJ7GLUVQ4q7NjepEOCRS8DnpYW8FKpJagwJ54noBp/QPDpSXsRw2J0VjXFavcXrSleb74rmemAl1ZflpZpi9nIbKdTUBzhwiW7j3PqDRpyDq+ZWEqx8wEol9tItwCqzRRJMHK72A1Xl5MWGAVw1BPZv2rnSZ17brUryMDOFPrGcuZsxfisCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gj5B81HFuDczKdS8xgddyzcYTOh6KbxnukmwxS8x+dQ=;
 b=X2zzJHr/zvBAGx9wcxkylDZSjEy1fXY19UEooDqd2MQVqhcGBUW4hd+hFhiWFidghkP3jIMtn4bU9IfC1lZwWUCdOH7rSui+ZxUDyhuQ1e5wDHWhmeIaVmaKxAsZD0fWX55KNilIE8rEewWDCSY0Ns/fodWfm/4Qj0qt/89tYAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM9PR04MB8180.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 12 Jan
 2022 14:31:49 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%7]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 14:31:49 +0000
Message-ID: <1ec3620c-3193-97c6-bba3-bb83c23f424c@theobroma-systems.com>
Date: Wed, 12 Jan 2022 15:31:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [PATCH 3/3] ref-manual/classes.rst: add setuptools3-base
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>, docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
References: <20220111195742.1921572-1-tim.orling@konsulko.com>
 <20220111195742.1921572-4-tim.orling@konsulko.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220111195742.1921572-4-tim.orling@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0173.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::30) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84156836-18d5-4130-9eff-08d9d5d84490
X-MS-TrafficTypeDiagnostic: AM9PR04MB8180:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB8180CD642E6A0FD832B6C807C2529@AM9PR04MB8180.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0kvlW0UvIEHcidm2/FaeGPuffPLVyuWdsGgoSy90und/RzA+EI1M0GmI3tbzEDP5KBYWq+9VTPa8x3imLBc/NiiJt1qSrasgkKvDEls4cuk0W7DmCLvFrLGT2+QNFPxNqO8O5DhIKMl4RPf55XiAIsjc08Y2z3jCNepdJ5RmE0pjUaNL7loT/xWiKr38yOM+iIUOaHpNUyU0vWn7n1YkwXBGqK0BL/mx7HlHqFgNyWHB9ZgqZNDSPR3ZTurD4XuopQPVADrWnWuNuZsvak0bihpwonfafJKW1zdaHDKzVEZuhVKF6YhmaY7ToMo+yABfYjgmNbMUMHXgeQ6JnOH7+uBQeaAxgvZDkMGrmf2mWfrrsdxefzeonADD/y14V5da3Vw+6DFrGAH0JRMFSZf3C6OQHeW+7dNNf8uTzA9rKfye3jdEK3Qh5wf5WK8kY3+TEnhqo1glqrcif408mLDv8hIinI5OEuR3YKVzoGbbs7eNwb4yjK6n0eWEaaDaSc91by3tO/GlnSOG6MDTleZRUHybo2dgeYdRGaNphNqDlBO6HOIt80kZjqFYb/Y7Kp+Q0oFhTB8Xst4HqPWf/CUD0yhOZVhWpxuBK2xzVe9nxH8It02ZO4mh5AJ1yh0Mp92Ke3w/3CXlP8sHQxTbFcb9Euj77dn/1AIbRATDTPkfWo+Y0VC9Uzeh/KXz/ipB1Q3lK+bUG36a+uL4sRRBRdivsJLhqZ1bR6L97Kt7/epmPGxxfzovexrMJhwdUIxeAzPwEhaorAAOQAWPSpBop5ilz9AwFD3RXFpONht4YOY93OoUzR3A+EVgNkq3uy0ttbMU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(6486002)(2616005)(36756003)(508600001)(6506007)(316002)(53546011)(186003)(6512007)(44832011)(31686004)(5660300002)(966005)(6666004)(2906002)(8676002)(83380400001)(66556008)(66476007)(66946007)(86362001)(8936002)(31696002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WXN2Z1NRUXd0N2FTUWdZaTNGNzI2ZWplTncwRVhwVFpyL2p0Y0NIMVFhRHk1?=
 =?utf-8?B?VHZvVTQrVG95RkJIcHZVYWxObjBhaTZSdUF0QmhWcjB5cjAyVWNkalJYb2I2?=
 =?utf-8?B?WEZHVVNoSFRZUWlCK3RROUNKbHVrOVNsQzd5RHU0S1ZFa08yRWNWUk4wUHBL?=
 =?utf-8?B?b2E4Q2xKNFFoZmsxMkdkUE84RHVnM0dPOGtmVWpKV1BWSHhZN1d0RG41MkNV?=
 =?utf-8?B?TjhmNWY4U09zUTJ4WFd0SlBqY1M0QnB5cGpJNzFEZWw3WWhCbzhJZkdaWHRR?=
 =?utf-8?B?SW9LaFkwSWIwazFMMkhHeVY1TEtDMGZ6SW9jOW1vNHEzdmNGbXBybm5wS1Zx?=
 =?utf-8?B?U3lBV04zVkQ5REJ5WUs0aVBkRXVHaldlYjVRQUU5ZER2UEFFYm1pZE10eDdC?=
 =?utf-8?B?MnJ0KzZTV2x3c29mWUVOcTVjNUltYmFROW15WjAwUDd1Y1h3TUhxdDdhRURP?=
 =?utf-8?B?TXdiZ1U5UmhGdFYrVUpXV1BiQmJwQmVOQ0M2WVhlUjZ5ck5tTUxxZXBwNCtE?=
 =?utf-8?B?ZFZpd3Y4VHc2aDRCVW16M29sQWRrT3lZOUZVdjUzWXVidU5yVVVHRHRJMVp1?=
 =?utf-8?B?b2IrakgzanA1YzRYU3R1SXVjUXQzdlQ3N0FnUDE4NzRNK0dpamFnZ0RDNlRX?=
 =?utf-8?B?MWpJS3VPVjBhNER3SVArN211Z0VIaE9QaDlVcmZrMWxXM0I5bitUWXd5bmtF?=
 =?utf-8?B?UEZjcVRRV2p3c2tBY2R2MUtmVEU5U0dJd3dWaUJub0dwRjJzWk9hYlpKbXJl?=
 =?utf-8?B?WVBVYUdQVE0rSDJQUHVwK0Q1NEw5ZzF5TXF3NzJDQ2V5Rzd1YUpxd2lzQWFQ?=
 =?utf-8?B?ZFNkOFRuUDR1MUd4Q254REQzOUQvNlJWY1paTFJDaVQ3ZHNlZXZTTllrbk85?=
 =?utf-8?B?cDlXbzB5Z2tRV0NuVEVwakRYdEdXbzQ2OWs0S25zS0VNTUtJbnJVNWVDZnRr?=
 =?utf-8?B?dzFITUFGdm44S3RlajFCYU5EKzRLV0NCL3Y4Q0RtR0JYczR1UFZoRXVGMkk4?=
 =?utf-8?B?RWxPKzMrSEo3aDh2WFVXWmhJSmxyQjdySWFpdm1hbk8zZTRiR2tQQm95SWJ4?=
 =?utf-8?B?U3hibk9xMFpDQkQvV29PUHpFS2tkMVBIUVFTRkkwWWdteGd0Z2g0aHJwQkdl?=
 =?utf-8?B?SXo5RmwyK1p0L2ZiSjJTYi93dE8rSkFLNU1nMmhhS3dldU1FNVgyUitEOXZE?=
 =?utf-8?B?NGtPZUtvVk02VEl1Qy9XSVpHVlAyYUp3dVU4K093QmhEaXFrU1pkS0J2N3Nu?=
 =?utf-8?B?T0JwdG9hdXc1djN2a1FmTy80bVdBQnBkdHNFQzd4akwxQzZDNElEWFlMWnZL?=
 =?utf-8?B?aXRUYTlEMzNYODY1Y3ZyeGEvKy9pYWNVSktFRmhaYnNQRWs2TnlnVTJ3NitO?=
 =?utf-8?B?S1pNaHR5NlBDWjJUd2FPdVdPa2J0c0dvUVFzTVF1VmNZM0twb1FnalBGeHdX?=
 =?utf-8?B?K3BmUGxnZFQ3dXhLanhRMzJIMmRJZ2k1K21iQmdsRUQxSEhXeWNBUmZ3Wm5F?=
 =?utf-8?B?Y3VlalRxOHhMRktpS1NveVRUNjNJOGdKS0VKTUJXdHZhU3FCU296VkFxdGly?=
 =?utf-8?B?b3RCRFFYLzVRQ1NHUGFCdmdjNGZGak00RExDNUtiUFRSK0FvRk4vMXMzVkQ3?=
 =?utf-8?B?KzVBZk9ZY1B6eXBYeFREbzdvS2NZV0d6eGlFUWRLU0dFWlJISFlpNWpBeWtp?=
 =?utf-8?B?VEkvMURSK0J1MnQ1Q0gyVG5LS3gwaGZCTFI4Yy84TlZYbnhWR3JJWlZpRDJE?=
 =?utf-8?B?UW5TY0VJN3RDUWJIenhYbGw0SVk4bE9Sb1E3cVlBTjhhOVZSdVR0NlRwSSth?=
 =?utf-8?B?NVZRUEFpTkxJM2dJNFU0Q3BkSS9ZSkhKeGxvSW12YTVHVVlMdUpaWFhub05E?=
 =?utf-8?B?N2VYZnkvYmpMNllvREhkMy9HcWU3R0wxOEdPRGtKMkFuNEs1V3BtRER6N2Q2?=
 =?utf-8?B?a1ZycENJZkNoTmlFUmpGWHRXT2dEanBIWGxpQUx4SGVzOWJmcDRJTHJRSGpB?=
 =?utf-8?B?SjNuUlJaMEF4cmlqK1FBYnZQbUc2VkxlWHF3TzRDYlFyQ0hxRldqNnBQZjB2?=
 =?utf-8?B?YUVHL3hWdVNZYmpnempad1Z6ekhESnc2b2N4Q1ZDMXZCZ2VTVGNBa01QREIr?=
 =?utf-8?B?Rm5KOGJNZ3BnMnQ5YWtFd0cyL0d6aHZHRm5BYk9zTXNPWTVCK1pCNmZ2dWx0?=
 =?utf-8?B?dVgvTWVDekJISG9xL1k5eURGSXdNTnR6ei9kbEgxMnppcVU5WHdBYlhvMlpU?=
 =?utf-8?B?d1RRMWVNL1Joa045RzdlRE8vZjhvVmE2dGRydVJuMC9pT2E2TFNkUU9zRnV0?=
 =?utf-8?B?a1pWNFZva0JZQTNKNXhZcWVSeDVldW1yNXBtZHF3OWdtcGFTQUxsQ3ZDNEJk?=
 =?utf-8?Q?BFkpYOjNXFtqlNK8=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 84156836-18d5-4130-9eff-08d9d5d84490
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 14:31:49.0397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kEnG1nZN/hSpF9q+HAOjkrNNQ4KmfCWjCkve8P/S6ntCj+oOo388ZVGSjragrxTIHAMqAUgvxVfTBtrpUfY5HxDR/Lqe1LoVBULFXvlETjFgzukP3OC6PjohTs1j4say
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8180
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 14:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2395

Hi Tim,

On 1/11/22 20:57, Tim Orling wrote:
> Add setuptools3-base class
> 
> Deprecate distutils3* classes.
> 
> [YOCTO #14610]
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>   documentation/ref-manual/classes.rst | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 99d9a7a3e..41360c965 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -515,6 +515,14 @@ used.
>   -  Extensions that use ``distutils``-based build systems require the
>      ``distutils`` class in their recipes.
>   
> +   .. note::
> +
> +      ``distutils`` has been deprecated in Python 3.10 and will be removed
> +      in Python 3.12. For this reason the ``distutils3*`` classes are now
> +      deprecated and will be removed from core in the near future. Instead,
> +      use the ``setuptools3*`` classes.
> +
> +
>   -  Extensions that use build systems based on ``setuptools3`` require
>      the :ref:`setuptools3 <ref-classes-setuptools3>` class in their
>      recipes.
> @@ -2376,6 +2384,17 @@ The ``setuptools3`` class supports Python version 3.x extensions that
>   use build systems based on ``setuptools``. If your recipe uses these
>   build systems, the recipe needs to inherit the ``setuptools3`` class.
>   
> +.. _ref-classes-setuptools3-base:
> +
> +``setuptools3-base.bbclass``
> +============================
> +
> +The ``setuptools3-base`` class provides a reusable base for other classes
> +that support building Python3 version 3.x extensions. If you need

"Python3 extensions" or "Python 3.x extensions" but I guess not both at 
the same time? FWIW, setuptools3 uses the latter.

> +functionality that is not provided by the ``setuptools3`` class, you may

:ref:`setuptools3 <ref-classes-setuptools3>`

> +want to ``inherit setuptools3-base``. Some recipes do not need the tasks
> +in the ``setuptools3`` class and inherit this class instead.
> +

:ref:`setuptools3 <ref-classes-setuptools3>`

Looks good otherwise,
Thanks!

Quentin

>   .. _ref-classes-sign_rpm:
>   
>   ``sign_rpm.bbclass``
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2385): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2385&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=h2Sz3gZJqoPsLKIfwNlfXAYFeX7mpQdP2oEhvb2aGweey-2-dybLOh-TQ4wdUyAn&s=M_b1du7dlXE8qFoFbIMq2Rl5WKpnDzSYPdMNNHYarmk&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_88357646_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=h2Sz3gZJqoPsLKIfwNlfXAYFeX7mpQdP2oEhvb2aGweey-2-dybLOh-TQ4wdUyAn&s=-Zmwc8AjGeJ5swQXxOjJeeJ_PhR3Yr1UOFftrABLXys&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=h2Sz3gZJqoPsLKIfwNlfXAYFeX7mpQdP2oEhvb2aGweey-2-dybLOh-TQ4wdUyAn&s=rOYWLxd9CDFOLemM4UKT_oz3hU5amnFuC7rGylfmQno&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

