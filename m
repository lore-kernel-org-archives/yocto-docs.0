Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7077CC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:20:33 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.50])
 by mx.groups.io with SMTP id smtpd.web12.25097.1653294025982107046
 for <docs@lists.yoctoproject.org>;
 Mon, 23 May 2022 01:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=S+2nKTuh;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.50,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6Thh8RCt2bXyVBPcp4fXOnu8lvsSdzcAjeWiO2vmu8Cwn94v60XDl+Zhk0JXDfrG7xIGdV8G1SWZEInp5ysjajGG+YBst03cKHJ4M4Eia/ulG0XCmAYIDivKjsypixE9T04foX+Ko77MLyd0SWgA3j+Zv+RfkMYUzMRikgNnoKV6jXiNTLcLcYHpEFGV98ATnKFeeYE1ETbmW/zoLyH1/j/VMVvSmvJD29O/tM3yuXxchmU1RxEwCGTU99acZxHfXowmuR4BWr8NkPDjCTsJ+u53O6pmp8OljXWSoiYO3+KsKCwkY939VIOeVueFnKLJRKKOKsITQema/HS22IfnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMR6+9WWkMrs3jvVEhEZp/DyTPVjRGx/S4TzoouKWWg=;
 b=nRqYu8q/M/u3hJgRrsF6gRMSMgnLS7EPFsMuEJG0K/1xrO5N5sbJ92CoXmkTLafOSc0YvehPSBkP9aQcM+C4NVMBfJIvl6ksIdPOJbYbL6Qu+i1xdz3sSvbomcs1CHe14JIgEprtZHgdKNz1HRn0JNJc6NOSzzT0X7Q/Mgjhr2B4Tp3OaZqicafduZBkfu6E1XUX3BLEYuSlnoIbq40mKlHdrZmJekla+1RPLw7NTMUCc97FfSLonRG1v5LFQ1iXFoC/M6+iS161pajMmQd4DEopZ5kQhCoxRkpyGLWJDJrzM7JO5r7CcZlBWeyZ9OwqUSUzvTMvfjyF/mwdUpkGzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMR6+9WWkMrs3jvVEhEZp/DyTPVjRGx/S4TzoouKWWg=;
 b=S+2nKTuhCbaOnKC18p/e8R3ob+h/9Dfx+ROECbExwKc5ehxM0RljUdCxCbawp5ui9kI05TzBjlZJpWva7HS6S71MKL9+SZZbe3cEkmo+2Fje8Rc5AOSqm84AXk60bLEliScVGGvfG9MHipRO3WhDH/JZUz34PWRCWlbGEt9ofjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VE1PR04MB6445.eurprd04.prod.outlook.com (2603:10a6:803:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 08:20:19 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e443:c646:c299:5512]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e443:c646:c299:5512%8]) with mapi id 15.20.5227.023; Mon, 23 May 2022
 08:20:19 +0000
Message-ID: <10955e67-9690-c82b-0b5b-c599aa3dd140@theobroma-systems.com>
Date: Mon, 23 May 2022 10:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [docs] [PATCH] manuals: add documentation for WKS_FILES
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220520183517.141145-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220520183517.141145-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0018.eurprd03.prod.outlook.com
 (2603:10a6:206:14::31) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7d5d1ff-9599-468f-1465-08da3c95130e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6445:EE_
X-Microsoft-Antispam-PRVS: 
	<VE1PR04MB64458F9A2764FB2B273AD225C2D49@VE1PR04MB6445.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zSqTrmvfRnuwYpqrHeZhFcciK9yyXXMSHulgfRnna1CSRtoVKRnh9J0TBnMNBhxJI9dz7BtKQ5sXNGJzb5TntjgYuBdJBi1oAscXRZjt7Jb95GfE0yhya4l5/HBQqPNGx03uV3FCTmSUIlG63lgqDZLgl1VcQpU3OV4mm4NGb21ekM6VXum1iKrzkQ5dbC55r3M1lAhzeG2kpS9N7pjFuWBW7WrMZNHcVfGGWHecZ9yz2p2eF7Epk4WDWqLUGx7MlP98jf4ueDo44zFwretlbrsZOjSA/Hyp6MRFXCL9UC5NAYTGWP7if0BYV1j2RddfkSP3Pj57sExHw4XwckSmOiBeHjCvo6bxmTwvFwSO+jhFiWQozqpip9kgpYm50Pe4sSc3p7XLznra9f1Kmvx9CkYCGQKPWMHj9jxSESn2cUucLGm4EsdIsGlsAow1zVRvP6wAqidEprJplHDEcGdVLTyIc5tI7bdggP+PjjqECTNWM5IMiTVPAjjB/DOEMtfLwEf0gtsa093zqiXtbtu42B+kpv8KD/RNbyQ0D1gpKp9AMSH9aHu6KW4AfniByuwFrE1OqEr7chT5R9CZgklIQTpOudkAs+6dH0QpXWFFzSD13EUdiKsufoRkqQzBTVban9Yfm5DCViA8QnamhioJ6dGHxsLxC5XMyWmlzm9sQP7fsFMd9FmRKjo097Yq/zsJ2IC0FfhqP6d3q67uhtfGhZ2WPLhh7+ejRySHyZhy1VU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(38100700002)(26005)(66556008)(8676002)(66946007)(66476007)(2906002)(44832011)(86362001)(31696002)(8936002)(6512007)(53546011)(6486002)(508600001)(186003)(6506007)(2616005)(83380400001)(316002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUJ1cTI4aTRNQVZmZGdEZEdQZUdtUzZvalpWNUdBdE9QQ283MTZXNFFON0c2?=
 =?utf-8?B?SUE1M09rYUcxR2w1RU0rbkpjdEh4a0tGdVFac05LQmxjNTV5dnl0bk1KUE1R?=
 =?utf-8?B?YWJSZTFzSFltb2RuVDZzNTczcW90MDA4bTZkS1ZocGZkbTZ0cVk3ZjdmMzhs?=
 =?utf-8?B?NkJtY29nTUZIVW5HOTltdDBwVTBxRW9YcmQzT1NLS3k4NGd1NzZwUnloVVhJ?=
 =?utf-8?B?VXBCNHhYTkhsTjcyY21CbG84QkN0SnlYTUZXdjB6bEJPd1cyeEZXNjh5NzVm?=
 =?utf-8?B?bWtHM3hxM3dtMDNYdFlMbnRwMGtzaTlUeWl1cUw0aERCY0FJV1JLSDVqTkVM?=
 =?utf-8?B?d1JqNEFUdWNBRFZJaTE5RGFSalhSWkw5aFdwd2VZMFdaZ1RRbzNVUDk3aDAx?=
 =?utf-8?B?WGRMdEJ2WFFHRFplK2VDUTBqOFFXa0w0Y2x3Zkd1cEpnT3BtbW53M2FIR0VC?=
 =?utf-8?B?YThPdEJ1eGRLdmhPcnA4SG02Rm1rdUFPZUU3RE9tUnVpVmQ0NktmTXMzUjdl?=
 =?utf-8?B?QytlcnRWR2ExSjdOUW5GNVNVRnNwc2tkblhoVndubVJINHYvODZSdGRoUEJB?=
 =?utf-8?B?RS84cGRCRkVPalRtREgyc015QUxkTUQ1dldOKzhMMTh1VVh0emxHVHJZRFNH?=
 =?utf-8?B?NUNCc0tWTUdGaUphMGxOcEoxbnI4ZjljVlBLZWRYZzBKZENKNlFyMExZcEZ4?=
 =?utf-8?B?UHo0VFNBZFJRMXl2MU5oMmJDaEVLaStXdDJ6OXlxeEJST2xHTlFjaHlyY0Zq?=
 =?utf-8?B?eW50SlhVcFg2SzFoNEJrSDhyS3JVQmllZHlPbGdoOFc5akowSU9DS1dab0U3?=
 =?utf-8?B?RUF6OGlCV1phZk9FNkFMeERBRmk0NUF6MGw3ZFVKKzZ0c0UrdHcvejFjTFRD?=
 =?utf-8?B?WG1SODk4OUI2T0FOYlFEczAxbm04cmNSdG0zVkpVRHlJdXNOZ09CS3JIVVNt?=
 =?utf-8?B?U1h2N2doWWcyUTd5bk01a0t6MTlNZENQMjEzZ3dLTURrdVJ1V2FhdHhXS3JD?=
 =?utf-8?B?dS95TFRCN3BCL3h3NEFjcE1vNnJ6V2R0aisrTmlSNWJ2SU54MlVZcUFWTFNI?=
 =?utf-8?B?V0JvV0FEYjVBVWVLTmFwRXE0MXhBNGJpMUpqTDUrS3cvdUIrWnI0V1BncUhu?=
 =?utf-8?B?WndxV0tCa2M3WDllNEU2SUcvUlhzeGpZMWQzUm96MlZXeTZEZlBTbTRLT3Nj?=
 =?utf-8?B?bkpvcWNxS1NBQmNPai9OVXpDNTNMM1dpNjVpNFRZd3I3ZHZEL2N4UVRlc2Fs?=
 =?utf-8?B?YWVYc1BySWs0aGcwR0pxd2g3QU13RUFsa3FKN3o2UU9oR3cvMmFNcmU2Z2I0?=
 =?utf-8?B?bjZJd2xDUDlrTVVKbDNubEdCUVhZZmpENW5ua0tIUkVYaFRlbXY0NGJUZ0hU?=
 =?utf-8?B?Qk9kRDZOaXFqRGRyQ082N1dpN3dKUVQzZnBHNEFPaHJaTmJ6bnVibkpVT2Y4?=
 =?utf-8?B?YXBDNFhKVXhtVUJDd0syUFE4cXMxYWt5SC8ybklnZHREd0MzSUhsK2dUV21N?=
 =?utf-8?B?UUl2aDVqUWtEK2RMK2NsbDJDTWpudFQ2Unh0bnl6enFrRXlreXB4cEE5Ykh5?=
 =?utf-8?B?Z2E3c0pySnBaeDJ1ZEU1ekU1ZENTTXRKb3F1dVgxNTRDTXZtQytJK2Jwa0ow?=
 =?utf-8?B?ZkFjVG9PalUzNG9KSnhIOHRNMjR6RzRoT1BsRnIwZXRKV09JSzRFRjEwTzBG?=
 =?utf-8?B?NjFGY1JMS3JzbXVpVTFRb1FoVGVsMHJqUTVRZVl0Rm9qL1dLUlNyR1J6cVZH?=
 =?utf-8?B?QjRmS0hBUnFBNjMvZ1Q4VW9iaVZsT2I1V2QwZUFQQ1pWWlc4YlJxVTNsODRi?=
 =?utf-8?B?YnpDZ1R5UkxCTEJTM2FhWU1IN3RURlcyRmE3OE04eURGWU51clg1QzhYdFhL?=
 =?utf-8?B?L0dmMFVkT0V2bE1tamJ5NmVzejRBbk5XMkowamxJVzIwZWZwMm1qKzB3RjI4?=
 =?utf-8?B?cjRVQUJES2U4MVJRL3ZwdGZpYUZIaXgxVWpqZEk0eW5KTUFGSml6emE2MFE1?=
 =?utf-8?B?eVFRa3FIV2w2K0FCaVJnd0tGZEJ3UVJlVG1NS1FqY3cyMXhvaXpMWVN1M3dh?=
 =?utf-8?B?VkwwR2ZRMlZRSldheWd0Nm1XSkV3VWtKdytmMEUzTHVlWlhiV2plNHh0Ymly?=
 =?utf-8?B?NllQZDRGSHcvVEJ1ZlFqam1PVHNoa0Zwdk1neTFkRXpBWEpJbURsais5cXRO?=
 =?utf-8?B?eWNyWXRoaU12QjZPSTIzdkpRZ2RySW9HN3doalBJRlBsZGVObTZ0blZVSXZT?=
 =?utf-8?B?QlBwUk1Ya1l3MitOU1pqREFON2R0SHVwYUI1OUJFUDRiZkJCeUZnaVdGVzBW?=
 =?utf-8?B?RVVoWGVHR3Z6cCt3b3NQazlOcGpzTDlkVTk4RGdlcDdhcnl3cHhnbnQ5SWtY?=
 =?utf-8?Q?IBRloiRQ7jKn2rJ6+BS6REIcN8X/XEyb5HLau?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a7d5d1ff-9599-468f-1465-08da3c95130e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 08:20:19.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 //gnVYxuMUb6Zm0BbVG0sCIvR1rhLQQadcneGMnTgXqUljMmU90ceNaJr9cSxe3LvBt27V9Nj144UOsc2/mS5Bt6byPKr/Z/Jjz/6PL72ikEHzMFKjRlNDOwqhT5z5f+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6445
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 May 2022 08:20:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2942

Hi Michael,

On 5/20/22 20:35, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Fixes [YOCTO #14590]
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/dev-manual/common-tasks.rst |  4 +++-
>   documentation/ref-manual/variables.rst    | 13 +++++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 3a47a9ff27..ca6d594386 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -5481,7 +5481,9 @@ system needs to meet the following requirements:
>      variable.
>   
>   -  Include the name of the :ref:`wic kickstart file <openembedded-kickstart-wks-reference>`
> -   as part of the :term:`WKS_FILE` variable
> +   as part of the :term:`WKS_FILE` variable. If multiple candidate files can
> +   be provided by different layers, specify all the possible names through the
> +   :term:`WKS_FILES` variable instead.
>   
>   Getting Help
>   ------------
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 146af89e8c..ce2b6bf68a 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8767,6 +8767,19 @@ system and gives an overview of their function and contents.
>         previous example, some-native-tool would be replaced with an actual
>         native tool on which the build would depend.
>   
> +   :term:`WKS_FILES`
> +      Specified a list of candidate Wic kickstart files to be used by the

s/Specified/Specifies/

> +      OpenEmbedded build system to create a partitioned image. Only the
> +      first one that is found, from left to right, will be used.
> +
> +      This is only useful when there are multiple ``.wks`` that can be used

+files ?

Looks good otherwise, thanks!

Cheers,
Quentin

