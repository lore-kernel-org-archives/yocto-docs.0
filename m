Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6C6C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 11:53:48 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.43])
 by mx.groups.io with SMTP id smtpd.web10.26791.1641210826725608417
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 03:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=MoVN/qQz;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.43,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGYl/TyFKE5fc8DFQdB6HizmPg88v3yDRMfeNlnH12p6UG7QvWYcMu0gxVcWAPBmN1s87baXxwPrajAq/ZQdZzwKExAmV7QnP1QF4EZ6GCZzGyF1JK5oBzJoLgHng+m/O1PIXimfNg/ZFr7dG5eP6k98Z+IFEnPcU7iaOOkZDyieHSFgONl6PB3Ark2kCk+HyT4FUDQzaI3tLH1/c6BOCI6RcAgMr1HCDa8uPVaTjbhpCsw0sPKX0qdIne9os/4dMMNbZ8LDpEseqERhsCp6arG+6JuzDDQ40nQkx/kidWtCsf6XnUdKGYhnp29pfSZRFpfhcEdpHSytESHK0z1Fhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4mPnh5NwfMaVKkced6dgvfrj7nH1kQ4UYU9LH9CjV0=;
 b=Ml2YXb9e1thV5Ouf1D7dM5kToVSuKUNH2BOvT2894NN95KDBI4xvwLh4b362ujYKInH5WLXSiFk0iWxq98Nj3yjNDCy0ZaE8aeS15KnbkJXM0NMQdZkh+jaBhFOOMAFziIpxC+LLAq3yINBPTDh7YLepUOm1NI/hsBx7JWefMOfb0j82OxlAFlsJUNm4fetgGC33jUpBOOig4yLYEh6jCEB4bNdKY0gJS8dx+DlyU5FhjY0uzWEbdmd78BFMOqu0w94TkeeBkWsROhCflj7ZeFROfSpshIPc2/b+E3uh24YMTR/9vDiV3/jKrGCAxOpDx55Yyv2rAWF80sg9Khh1IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4mPnh5NwfMaVKkced6dgvfrj7nH1kQ4UYU9LH9CjV0=;
 b=MoVN/qQzpIV5xjRsoYLSAY3v2BB+okukNMA39Y+FmXImYjW9ZO6CJ7Z5/fiXM4xrL6i6lYznsmbmTTipmEi21SQ6AyvV4aSOEh2S+FwMmSGAYHMP+YSyKR7ON8ByMsk5dvpTbukUfRgcEXl3zqhVkirwCSkRmxBmauBoE8m6EeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Mon, 3 Jan
 2022 11:53:43 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%5]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 11:53:43 +0000
Message-ID: <21ea4b42-153a-c8d0-8e47-8a9e7f867174@theobroma-systems.com>
Date: Mon, 3 Jan 2022 12:53:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [PATCH] ref-manual: fix patch documentation
Content-Language: en-US
To: Max Krummenacher <max.oss.09@gmail.com>, docs@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
References: <20211228124602.3268-1-max.krummenacher@toradex.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20211228124602.3268-1-max.krummenacher@toradex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0173.eurprd09.prod.outlook.com
 (2603:10a6:800:120::27) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5321692-c1d1-4646-1789-08d9ceafb0f8
X-MS-TrafficTypeDiagnostic: PA4PR04MB9438:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR04MB94381A91078493CDAA2E8A88C2499@PA4PR04MB9438.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3ex1KM8Abb9AwIPMBZPh5ULOp7FYJ0uFd6I7UdvPiz25KIlq71+XRiy80QBUHrwcl34YE2qkhemblfjNcMI6A+AkCrx/BPQGVgqimqUxAUl4NvqjNnue7tGiJuEGYFuZrOll91bEhMM6j7GprJGu+9zQ4kW0Z0EwuJBLj8o7kgBjRAeqq7OxMgRIbLc8pWckC2qKHGfdKMtyez91drVZXbfBYJVZUZ4CHgezqhLQzCxuFJAi3sj/PPtWBKTSFHlP/f7LWJcSkmFDXLIGzrheH9S0khxXt8eRfpguxzGUwb6/PVV2vb1KLumvGccIRNo2k8TLr7SwKbUwwxhHD1VvX+Cq4iJNEdqbyaDBrAW1uom3lxelle6WfE9E4efJatLCpmGDRRbw4G2BCVqeesa0LgJEOwOeZtq9UmecJn7l0N11hSJFk4CSfGI5Lc24uT5Ld/2miSQFCan6pVtDbklYToK9GehdSzEdis1nxHU5baiW8ExEIgVuZZGl9ovHE76LvzCsdtkbhZ1aT9FJyqOPXimqLfo0lSMBweZ4F48Vu2epIIst5duOrjOa5aowmKhEaaonCu/95RfWwH9w+8hNTGIEEU6gdPB/nm8JULzZfcYgXFoDO2Jg/6rwXAYGCMOj9BlNHemJpM0TptlennOMUnIdXFiTEqHiynb2Wz3Wk7PWMBYmIBfGy3fTK44uDuNDU18YvtpdRKL7BYMfvX6A+3jASWR6Dg+wej9J5fJnxC0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(83380400001)(66946007)(4326008)(36756003)(31696002)(66476007)(31686004)(6486002)(53546011)(6506007)(86362001)(66556008)(6512007)(2906002)(5660300002)(186003)(2616005)(38100700002)(8676002)(8936002)(44832011)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RlhPWXNBR0pHZWpuWFN1VmFyRjRMR3N1cTg2T213UXl3WTh2dEI2TEQ5K0do?=
 =?utf-8?B?ellpNUNuOTl0Y2FYUStMMDB5cGo5bEdlUmIxcGk1Zm5vMHMvZS9YOGhZUHFt?=
 =?utf-8?B?V3JmUEtnYVNJdDFPa1JnVFJtMldpclMrVWp6ajJtZ0Jxa01ncFZWWm5wYzU0?=
 =?utf-8?B?WDZTbEIydDh5MWQ5WThDamtvMTRWNEFCZGdFbVlNai9iQnNXYVEyd3Y0cEt4?=
 =?utf-8?B?U2hhWEwxS1BMS2NrMmdMemxpTnBCODlJMWdYVytjUitpZloxajB6N0lqZlBB?=
 =?utf-8?B?SWRsUzhuNHNsZHJaaDkyWU4wczQzQ1VxNGZYeWtZT0J1amRtdEQvTEJrcGlw?=
 =?utf-8?B?cWF0Vk5PT2poOVJZSkNWR2V2ZWRxdis1TXdBTDZEazRzVGEzenJ2YysxblI4?=
 =?utf-8?B?a1VhQVY2SjNseHh0UWlseXRVbVExdHRGV3JPemZkdGdjU1U0UGt0eVp1R29T?=
 =?utf-8?B?QjhrL3d3c005NnBZQS9mNWQ0NW1MVmpRaVoydkpZZmtNMHJkNGwzNm5ySFhB?=
 =?utf-8?B?Tjg5OHpta3JOd0M1WjM3bTlJRnJTQ3Y0M05FM2NibnRTRjk1UG1YS2VLMWxQ?=
 =?utf-8?B?TW9mRU9kUU9ZZTRBcjA1aXNtRnJtVHE0ZVFNVjlEalJlT3BNWWM4aGEwOW1x?=
 =?utf-8?B?dUcrVWlXRFdzeGxvWCs3ZHJJSTUzc2xmNnVTVUtWbEtUeUZpN1R6MlpzcjZy?=
 =?utf-8?B?MVNCaG1aZEpRNlZjU1o0dElHc01CNm4wTklMT1JoN1VWMkliTXg5MEdJKzhM?=
 =?utf-8?B?VFg0Q1RXbTJwaVZZRUNXNjRnMG9ORXlvTzdUNWQvWklwejIzb1l3V2tOYXNv?=
 =?utf-8?B?eGp1MG5DWktLMFJldDFqVUltTDlHUkdLSGFHa29MNldabmJyNjliWTEyc1Zq?=
 =?utf-8?B?ZHNxUUxQTmYxdjFkL20wd093T3F0ZnlXVEFPQStsNW1JaVF2ZjlINzlMSmVy?=
 =?utf-8?B?eUVEZjB1K3hVZWY1ek5WTC8zN3VqNU16dGNZcFI1RkM3YTlXUmx2RjlqWGpu?=
 =?utf-8?B?Y2t6TGx0Vm13Ym9xeWRUcXZnNDR6bWl6OHZFcU9Vc0RUK05rbHdUMEtQYmI1?=
 =?utf-8?B?eXZKd3NQcTZIckdvQjhGMGxBR3B2QUlzUkxqQUJ6akRBWUhtVmtrT2c5RDN5?=
 =?utf-8?B?c09UZU1nakEvRU44dW0rZjVEYUVEb0JFcWR3N1pYNnNxWE9xNVdWbXhXZGlI?=
 =?utf-8?B?enNOS1V2cmNkYjZDS29qeE5EbDVOeXhDdkxuaC9CTjc0YlJBamJaSVNnZUNy?=
 =?utf-8?B?WGovbHFnZEd2MEpkR2VXR1VyaExXSUVoYmZ6OVRmSXlhZmtSQzNuYS84MDhV?=
 =?utf-8?B?L2x1b0RqV294cXF1djRvakhuU3JDN0g1ejZiWTUvSElxeEJ5ODMwL3N4clpU?=
 =?utf-8?B?UXcyeHI1U3BCZndnYUFjN1RDdzlHaUtydUpjRzZ0ZzNxTUhpd0dqUkVOZ3Iw?=
 =?utf-8?B?bUdUTmhiVHNVSXRxRFYzUkRmT2d4cWNQWGJxc1dYNzNRU1BUYVpQN01sOFdo?=
 =?utf-8?B?U3NlVko2bUtUY0syN1BEUVR2MEJPSkRNZFN5Zysyam8rcCtWZFJuOTFHdHFa?=
 =?utf-8?B?QmVRei9EaUlKZjdFYnRwekZlYzlpNnNnMStwL202VlQzOG5BSFRvajNnYnN5?=
 =?utf-8?B?Y1hoQmZtcGhHMWVUVGltdGdyU01rRUd1SkduY0JVOEhHV0FDTU5yRHBrTm1x?=
 =?utf-8?B?N0NveDRoNkQ2UmRod3VnVjE0M3hDN1VMaXJCUkhuQnBiRENPb1lFUWNoN3NL?=
 =?utf-8?B?ZzRnUzFldkFuV3laNTE1cUhmREMrdmZOamtETFR4QkdkakF2aDNnYnpkb1Va?=
 =?utf-8?B?MkxDMXo1aE42WExGZWpRMm96WkUzM3kwNVhYem55dEVTRFpOQzRMWDkvU2Y2?=
 =?utf-8?B?K3dFMCtWS3dnbFd6NVZvSEkxYUh2TW5scVdQeGluaEZWV0N5WFRna1VQWlZN?=
 =?utf-8?B?THNzdWZRdnNsVDVwSGQrYnhmdW5ORUZZVzRxK3RNRnBEZGJSYlp4bFA3eURT?=
 =?utf-8?B?dkN6ZzVtd1pHbTN4b1FxbzY2S1JxQW8wOXFLVStnQ2htSFpBMWZZZm16T1Vw?=
 =?utf-8?B?anNUV0JDRi8yWFYvUURBSTdPZ3o3M2FDQnR3TmIxQ3pTT09wTitZQUExVks4?=
 =?utf-8?B?YjNwN2pPZHVXbFFONWVkN1JObjI2VHZzWDhaWXVoSUdlNkhRREN2T0lPcEQz?=
 =?utf-8?B?eVVFS0U2cytsYUg3bGJ3Wmt5YVpqdXp1NTZuNEdKRDZzSGJ6Z1JPZHYzRE1H?=
 =?utf-8?B?ZVN5cTA2T2JNQWZ0RlR6S2VXdmFKK2VtQnF4ck01SllRZmZaQlVmVkxnaFdO?=
 =?utf-8?B?blh0U2YzNWdnakYyTGJyZ0RjNzlySDdIcHRJUmNqd0hCQy9LWWJyVzNZOFdE?=
 =?utf-8?Q?NZWITyzmQ+mn8pso=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5321692-c1d1-4646-1789-08d9ceafb0f8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 11:53:43.4532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HfqqIuF7jCPIZ3CkjIyhcEf8iooi931S2Z9fqbmjDTUrS2HZbAJRwCN3qTApkkbL46JpCCQNlW73cxPIKAjdQvEqdoLZ8Xcyi6hGLNutUvrKN7G6JH5VTZDbf6E8rNRZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Jan 2022 11:53:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2331

Hi Max,

On 12/28/21 13:46, Max Krummenacher wrote:
> The do_patch implementation does not apply patches from an entry in
> SRC_URI pointing to a directory.
> Remove the claim that this is implemented.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>   documentation/ref-manual/tasks.rst | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> index 8d563714a..76f55e1ff 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -326,21 +326,19 @@ file as a patch file::
>          file://file;apply=yes \
>          "
>   
> -Conversely, if you have a directory full of patch files and you want to
> -exclude some so that the ``do_patch`` task does not apply them during
> -the patch phase, you can use the "apply=no" parameter with the
> +Conversely, if you have a file ``*.patch`` and ``*.diff`` and you want

"""
Conversely, if you have a file whose file type is ``.patch`` or 
``.diff`` and you want to exclude it so
"""

to match the wording used for the apply=yes example just above the git 
context above.

> +that the ``do_patch`` task does not apply it during the patch phase,
> +you can use the "apply=no" parameter with the
>   :term:`SRC_URI` statement::
>   
>      SRC_URI = " \
>          git://path_to_repo/some_package \
> -       file://path_to_lots_of_patch_files \
> -       file://path_to_lots_of_patch_files/patch_file5;apply=no \
> +       file://file1.patch \
> +       file://file2.patch;apply=no \
>          "
>   
> -In the
> -previous example, assuming all the files in the directory holding the
> -patch files end with either ``.patch`` or ``.diff``, every file would be
> -applied as a patch by default except for the ``patch_file5`` patch.
> +In the previous example file1.patch would be applied as a patch by default
> +while file2.patch would not be applied.
>   

s/file1.patch/``file1.patch``/
s/file2.patch/``file2.patch``/

Cheers,
Quentin

