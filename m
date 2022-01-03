Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F2AC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 10:32:14 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.47])
 by mx.groups.io with SMTP id smtpd.web09.26380.1641205933196264217
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 02:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=RFgZVvHb;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.47,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wn/iuljS61J1CPu0tTaPwAjRe/JWxkJ0tMFeH/eKIl4iWdXCiA5cVI5DyYXnaGRfEbqPj0q68sKw3Turmllk/8ujanZMFzy4lTxqCPaRMYhOVUjMObwQdnh6tqBYb1d2mjHHh70r7/AEKI6aKtWgo9Apr+siOGQnWzM0aIj5/cDwugraHYUFBAbHqKbMDOsrOCluO4h8FyM9OpJSNUTLJmYs1kbl+cOnCxeGSukKMtwZ1DSFf1aG9WrHNNSYbSNLsTAquWxDR9FB64WhK2If+Wr252vjQ4XR/9cuVCLGsbkjHkOW57uW45hU0IBqUhZ7e0OcuIlKMHGfnINxO1MU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg3sae78e0aDJJUnTKn/jrcZQg1EVAs4FNFYqA6oGT4=;
 b=RuGeVyC4UagJZ0t+aYQlpi5qSx+VsuaIuq9F1bJ7LtIQ249YjN4wgDUBuMmZrkcjoHchOGfAZ274WWPq4BuJ3KSDgoBNxjYBi7SVtzCiVF2ZaLkYjmiMItpy/IG4DQ2y71zypOaCIxpAxwzHQXSyqaLa+HUXgFTHM76OcydLSMQ8X8QUOag7T2uo+RnopjEy7pZtzDooLN/h1G5gUSRLyh2fDJIzskg5ZWXSIo0mjiCx6FqdAWs6AopGhw+tKoIfGmdhPjUZ02LsJSXptg5OKr41G6Wa12FIhhmWgKYh/Jwcam0QmgNL9D5KZOeWUvAIUw8ME9DeXApGP1qnlzIsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg3sae78e0aDJJUnTKn/jrcZQg1EVAs4FNFYqA6oGT4=;
 b=RFgZVvHbZgv6YNgpj7uc8zupuDnf65v1PWF+yyHYyOKfQxLS9fLgNjUh/bsVDTMOM/1Yy4VueiUDRYd0WCi4wStLGEW2vn9XQXZLmxnxsQvUGenwXxwn0YaquBRBXYrLkN48yA+OoZui8oOBAlzp8es4YZWAQsEC7rDNEWeouWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Mon, 3 Jan
 2022 10:32:10 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%5]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 10:32:10 +0000
Message-ID: <80174b6c-01ed-2658-23ba-bbfcec132ce1@theobroma-systems.com>
Date: Mon, 3 Jan 2022 11:32:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [PATCH] migration-guides: prepare for release 3.5
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <20211217140415.49840-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20211217140415.49840-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0701CA0060.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14b1767f-7e17-4975-9618-08d9cea44c6b
X-MS-TrafficTypeDiagnostic: PA4PR04MB9295:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR04MB929534FED2DA4DE4B39E1268C2499@PA4PR04MB9295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h8VCm1B+L3qzd+lLSUIygZq2uLY9joJks8qwxi7zKri9xL2qLSZZnIDLJQDtvdmHX3IumDGrcfX52nHZ/F/nV97IsxfzPGSOeZMiJZpxjBnsMjJ4YRsvJH8rTyFo6Kv0eDzTe0dSR2bGDoZfYY8p9ppi8HOgNEKCAO72kYSOsYhohUh/vj5AkS0yUVBj8kAF7fVZgVXQTzWqm3Gl1QQDhNEQepO+YN1pZSl5F6vLIUkA8OcwqdhgwqzO43+m3MQFk89YAueoO1lRIzjAy3J9XrYYZDuaW8v2LO8k1wsLOI2MTnD2BzvD4GnmrbOnBer5+uNUII9l5lbcAtRzVg+IUEFykyJbm+KF8SLE4RfR6Ya8zFdu1PEwkkNfKnQwM6TNF6ea3qjKhLt8HbSkyY9eXdU3/SWfajrQDSvBHUxkmVJc0kjLnsxH6ZyJ4xPk29SU0yu3ciQBbYNBMbwx73dqpiYn4102A8jGn+94eBSFu27F1BQUcbISZkqw0n/F+VmSGxZu/m5tg8rKVMd3X0UOQqETcOY7f8eBrdnUKxp8h6DYUg/7AQ5gK20s8kWFjZaEOTs1nmHaFG9EWpp9yJThx+QplvTyuuxrCapy2PyDf7i8p/LzCLPHb2PV9tDWs3qfMCqsm3XHLw0nwQzpAMgbxOxXfGGb2cDJII3LSrI5wkdTPefAdBwc0hczyTSitWj9SriRK6B7yoqGHYs1z0UQSrQLP5BJvsoBoX7ikDkWZWX9xHFfI3dbGAP61EDiqL9lLsUkTTyhm6ESNSo/uqNbzdBqbIAZKmeYfXk2RbXfcIXyeYHN9SuiLYgdagi6PTD94I2XGUhh+ZyX32wf9FwfNg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(6512007)(36756003)(66946007)(38100700002)(186003)(8676002)(6916009)(508600001)(6506007)(53546011)(966005)(66476007)(66556008)(2906002)(2616005)(6486002)(44832011)(31696002)(86362001)(316002)(83380400001)(31686004)(8936002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clBXbHJFUzNxc2RUZjFuRjBuRnlEdVhkNmxsV3owdnlVdjMxYzJYbWdLU2Fj?=
 =?utf-8?B?RlA0Rjg4SmFOK25mbXdvcVBrS2dUYU0zZk9pc1cvdFVHd1V6eUc4VWIzMENy?=
 =?utf-8?B?Zy9taTNQbGJycmNUMzNrbUN0ekQwcG9LbHU3N0V6SjVwbVdyRkZ5aHEzeTBE?=
 =?utf-8?B?L3VQbUdvdHlWcUVBcGhRcGk2Zjh2UURwUFpPOXlNNFFBMzhGRXlIRVUrc1Rj?=
 =?utf-8?B?aHN4R25Rajh1ampDS2pZYkpLSjZoOTJYcWEzd2lLNzMxcTZ1dHBBL2xWb3py?=
 =?utf-8?B?SjkrU2kvQ3hOUjJScWdzeXJONU93Z0NsV2c4YkljRzZYRW9YUkFHd1Z4OHU0?=
 =?utf-8?B?dWs1dW9iL083d0ZLMFdJR1IrbnVSOGdUYXRnZExIWnVyTUUzdUZodzg0VENy?=
 =?utf-8?B?R0NMbmJVWXdWZ1BYQ3dnZGJXRTdSQzJEQmRHSW1YbG9YT09iVVhlNjdoYkxG?=
 =?utf-8?B?Sk5oZUllM3NvMEdrMmQzS0pNSEw2eGFvUG5HdW1LeldvQ0dERkdvODROZmVI?=
 =?utf-8?B?QnpaMEtIZ2NPRkg3dWFWL05EQmVFT0x3TUQvUFgvb1VkZ2FYV1BpWEFwUFRB?=
 =?utf-8?B?UUNjYjd5emxaTkM3K3FjN25aM2dIaXZRVTBUMlBJZWh4RXJrZmZvSTlDdU5O?=
 =?utf-8?B?ejZERGdvOFp1VEhPN3F1ckV5US9oOHVsenJiSU1MSVJEWlNNeE1zL2dFNHRm?=
 =?utf-8?B?QjAzRk5BTXM5aEM0U3lKRGpNTG5DTyt1M2lHMjBlaTRDeXJDWjJEYUVxNStP?=
 =?utf-8?B?V1RFQ3M0Y3llT2hqTUxsVHJJZm1Sd3IxOUM0QzUwa0NCMGhPYUl4U3VHR1hP?=
 =?utf-8?B?bFQ0aDg0UnZVS1g4dWJEQVZJd2RlYUJiRk5jSk9nVklkYTVNQm9hYjg0WVUw?=
 =?utf-8?B?SkRsb2lZQkdGTDA2Ni9sUnFCa3BocEpuSHM5RU9HclBqOS9DVVZoaDhIL0lO?=
 =?utf-8?B?L0I4bFdEK0tqbzg2aGdZV2lQSUhzNVdQOFdmN0xncUlmbmFDN01FdElhOGZR?=
 =?utf-8?B?NGFZS0lDeUhHMTMrWEhjejJjcFdRZ0p6RWMzS0NVc1NoSHJBQUYvdnYwUkx0?=
 =?utf-8?B?dVZMbDR4eUFkU0tlQzdYQ1I0MmI3Rlhqdno0UkxLejJvWUEzNGIyWnVRb0hS?=
 =?utf-8?B?MW10ZVB2RnZVQS9mcEExVXpVblg1WFZZYytrNHBONkV5ckZ3V0hHSFhrN0tP?=
 =?utf-8?B?a0lJMmxHcGlWVHNoOVFjbWtIdTl2NzdYMlFFbkwrNnl4bW1YQU8yWGk4Qy9n?=
 =?utf-8?B?QXhkL1NDN2trZytBb0RMNUVBY20xSFBPUUhWVVZhU04ya0NWZ05OUGYrNDh4?=
 =?utf-8?B?SmsyMlZxRElYNGl0L2phamU0aWJDV0RQaGhoNVk5UVBVb1hKZEFRLytneDdS?=
 =?utf-8?B?Snh5bFpldC8wZC9QRVhMMEhWT1JwdnJHZERvODRNT3JxL2hnV0lER3VoMzhE?=
 =?utf-8?B?OFlHSk9EQVN1WUpHd29ZWVBQMThQTVBkMDl4YmZpdUMvQ1VPaGdCZUhRZ3Zw?=
 =?utf-8?B?dVRZRCsxanVhTUluR0V5NS9oVy9XRzRSbFZFSytMRXVyYlJVT25mT3B6dVZr?=
 =?utf-8?B?d09FdThXVVNudXdrZVR5aGUxR1NNa1RkMDh0TWZpVjRLbmtEaDRvRzFIK2ho?=
 =?utf-8?B?bjl2YmE3ME9MM25rb1RtWlA3T0dvWG9Xek9RNjE1WXZ1MVpnNktDSzRYbFNZ?=
 =?utf-8?B?bE4ybGt2ekNGNHFWeENCOC9KeUIrWnk3bUNOdzRSTXRUNVpXL012UkFLRUhT?=
 =?utf-8?B?dXJsWU53eWVTYWZQTnZKcDIydWdzZFNXaHZ0QVpCZ244NFJDak5uMSszbGkw?=
 =?utf-8?B?eEt2aDhHNmZNa0kwcWVjVVZGZWNGN01xSWZuRmNMQU9NRUNqdENXYlgyY1ZD?=
 =?utf-8?B?SVgvclRoeTJhamtCMzFpY2haTkU5RmI3QUpHWXh1bXhUZExPNHNTbU5SZWRG?=
 =?utf-8?B?RHFEVkowV1F0UmcxK2FieWY1bU9LNTFhbVd0T0VQR05HeTI1QnZ6NE9tMHg5?=
 =?utf-8?B?RTJVRDFxc0N4dVF6N2ZNNUFFQXlKUVFJNjNzUkdBR1pKQWs3QXRwNEV4WFp5?=
 =?utf-8?B?NS9sclJ3c2VlMG5CRnJBbVFnRDVwaG82bDRaU0c0dUVyTlM1THRhWUM1b3BK?=
 =?utf-8?B?N1loZUU2YjVhVk9TTHFMdEJuSTNDbjNsN215TlNMbStkd0djZTc5Uk9BOEJP?=
 =?utf-8?B?cEhXaE5oL0o5QzRsYzkyR2NrNkNkOGkxem5RVFBlM1l0cWtSUlhUZThFWnMv?=
 =?utf-8?B?RFZXY0xIa2ZnVGJLMXNFQmQwS0xJZmNSMFNGQnN2YUVpUm5OVWk5dnV6T1F6?=
 =?utf-8?B?QTJZSWlZMVJFdWNHYnR1SFcvQ3UySkR1RzlLZlJXelBld3VWZ2hFczhaQzFV?=
 =?utf-8?Q?KaEv8k8b3VLvLhpw=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14b1767f-7e17-4975-9618-08d9cea44c6b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 10:32:10.3900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aoGfLZt/pJc2GBIVcJ0Qw5l/Wmjn5uHCLebAjvxLfbXECsfTGs29ZSBhh5+1CW1/gEZ2/0BamQyN9jHCvrO+1imcC+4IRcPxDlH1SYCKOaamYTCKYNexl4PlXHyno4dC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Jan 2022 10:32:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2327

Hi Michael,

On 12/17/21 15:04, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/migration-guides/index.rst      |  1 +
>   .../migration-guides/migration-3.5.rst        | 37 +++++++++++++++++++
>   2 files changed, 38 insertions(+)
>   create mode 100644 documentation/migration-guides/migration-3.5.rst
> 
> diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
> index 287b553195..6472cc2848 100644
> --- a/documentation/migration-guides/index.rst
> +++ b/documentation/migration-guides/index.rst
> @@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
>   .. toctree::
>   
>      migration-general
> +   migration-3.5
>      migration-3.4
>      migration-3.3
>      migration-3.2
> diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
> new file mode 100644
> index 0000000000..c63c9dff05
> --- /dev/null
> +++ b/documentation/migration-guides/migration-3.5.rst
> @@ -0,0 +1,37 @@
> +Release 3.5 (kirkstone)
> +=======================
> +
> +This section provides migration information for moving to the Yocto
> +Project 3.5 Release (codename "kirkstone") from the prior release.
> +
> +Recipe changes
> +--------------
> +
> +- Because of the uncertainty in future default branch names in git repositories,
> +  it is now required to add a branch name to all URLs described
> +  by ``git://`` and ``gitsm://`` :term:`SRC_URI` entries. For example::
> +
> +     SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
> +
> +  A :oe_git:`convert-srcuri </openembedded-core/tree/scripts/contrib/convert-srcuri.py>`
> +  script to convert your recipes is available in :term:`OpenEmbedded-Core (OE-Core)`
> +  and in :term:`Poky`.
> +
> +- Because of `GitHub dropping support for the git:
> +  protocol <https://urldefense.proofpoint.com/v2/url?u=https-3A__github.blog_2021-2D09-2D01-2Dimproving-2Dgit-2Dprotocol-2Dsecurity-2Dgithub_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=BHtIscjgpnlAxrsnv58CSizo0w27BvdJhKyrnKN2iWSXMxSc6E9_hS4mbjYz1tJ7&s=dHvCcZgUMuYx5xpf5Vm0zUvn-LHw3OZ5u2E8xzrGUGM&e= >`,
> +  recipes now need to use ``;protocol=https`` at the end of GitHub
> +  URLs. The same script as above can be used to convert the recipes.
> +
> +- The :term:`TOPDIR` variable and the current working directory are no longer modified
> +  when parsing recipes. Any code depending on that behaviour will no longer worked as
> +  expected (we don't know of any).
> +

s/will no longer worked as expected (we don't know of any)/will no 
longer work/

> +- BitBake no longer supports ``append``, ``prepend`` and ``remove`` operators
> +  combined with the ``+=``, ``=+``, ``.=``, ``=.`` and ``?=`` operators.

I haven't checked, but what about ??= operator?

> +  Such operations should be made using ``=`` alone. This means that > +  a leading space may need to be explicitly added.
> +

May I suggest the following instead? For the whole paragraph (provided 
??= also isn't supported).

"""
The ``append``, ``prepend`` and ``remove`` operators can now only be 
combined with ``=`` and ``:=`` operators. To the exception of the 
``append`` plus ``+=`` and ``prepend`` plus ``=+`` combinations, all 
combinations could be factored up to the ``append``, ``prepend`` or 
``remove`` in the combination. This brought a lot of confusion on how 
the override style syntax operators work and should be used. Therefore, 
those combinations can simply be replaced by a single ``append``, 
``prepend`` or ``remove`` operator without any additional change.
For the ``append`` plus ``+=`` (and ``prepend`` plus ``=+``) 
combination, the content should be prefixed (respectively suffixed) by a 
space to maintain the same behavior.
You can learn more about override style syntax operators (``append``, 
``prepend`` and ``remove``) in the :ref:`BitBake documentation </don't 
know the path>`.
"""

The path to the doc: 
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#appending-and-prepending-override-style-syntax 
and 
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#removal-override-style-syntax

Looking for those links, I also noticed that we haven't updated the 
bitbake docs yet to remove the explanation on += combination in 
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#override-style-operation-advantages.

> +- :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
> +  which use ``PKG:xxx`` renaming such as :ref:`debian.bbclass <ref-classes-debian>`.

s/``PKG:xxx``/:term:`PKG`/ ?

> +  Doing this will produce an error.
> +

I would remove this sentence or give the kind of message to be expected 
when such an error happens.

Cheers,
Quentin

