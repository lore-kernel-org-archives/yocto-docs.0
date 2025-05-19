Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223B2C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:01:53 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.66])
 by mx.groups.io with SMTP id smtpd.web10.48567.1747652511952307877
 for <docs@lists.yoctoproject.org>;
 Mon, 19 May 2025 04:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HOqoxVIy;
 spf=pass (domain: cherry.de, ip: 40.107.249.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tX2uFDwsuUQxdZoAO5R9OUMS4kfzh8JgiOVlQ4+ocmXRm4oWd7NtqgKvhWpOVS0BypVWxdtEQ4xVw9k87DQtdwFKNkYO3ueMv8dx28191YnLrZNJaMi2CSjSv3RzLH0P6TCi4XwOwRG9yg8nVKUuep6Xe213dBpNf2N+JkaZ35xWU6+k6zpacXWHRfbGDks8yOa0rDpwanHp1uXjqh7N/XCSS3irCNYTE8v78OXsukcrgUd5TJCSD+G/xSMe8CtjzpOvGTKk65gFuqcfftsXJasnkWf1MOUdzhhVvK2NBCXEC1NXKNxA9qimoaHJ9biHY73y23kBK5LBv1v/wnkSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn9TjDOgjfxMun7rWK0dG+lw0iut7ezFm3O/t21MsI0=;
 b=mrxdiHsTAQOg3J5sz+suj/drcXzukH6lWuIFZVODlTC9gafPu4k8Lcl0uxQpZwZGmAvxihJYUUgM2Hwx31sD9CuqF9jAo7HRV7RoIHPLeDNF+0ffjy1cv1UxHFUcilxeei1QCyBqg7vamYm6OuZ7CSArMxZDcRktlILyf0r41H6zmVwAW/4aMylOLqzZ+g+F6tBHZRF251REpl4Pv7qS0H/Evb0xoqt/P3IcgrMl8IYw3izzGFqQ+DIvW3KxPJbbrxFGWOr9wIWosPaS1d5DxwK8wQXV980EIN4U8rtHSc+GKO2ZJOzzHGTeKk0TBTJHde0oARtVAKqf65/VuwkWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gn9TjDOgjfxMun7rWK0dG+lw0iut7ezFm3O/t21MsI0=;
 b=HOqoxVIy1Od3GulUtGm1pS3ZEKKsAZxcLWIVne28Asr2JYLlkkWmHwXeObVcO09d6FgbxvulFz4/C6aRbq8yftsA6wYfUGfME5gfzoOtF4sxWna+rfq7Sq7Augp/yqzeouwnYVJxh9HBz0cp7aHnwpZ7+xBtAH02MEx8yEiuT7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8595.eurprd04.prod.outlook.com (2603:10a6:20b:426::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 11:01:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 11:01:49 +0000
Message-ID: <9cce36bd-fadf-458c-8495-c3018a5b0b94@cherry.de>
Date: Mon, 19 May 2025 13:01:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
To: gavrosc@yahoo.com, docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
 Randy MacLeod <randy.macleod@windriver.com>,
 Antonin Godard <antonin.godard@bootlin.com>
References: <20250517144959.5403-1-gavrosc.ref@yahoo.com>
 <20250517144959.5403-1-gavrosc@yahoo.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250517144959.5403-1-gavrosc@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8595:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a72e7e-50b8-4b7f-8298-08dd96c48d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YmJKd3lCTnVxc2ZrZVJMTXNzUk9wdU8wVFdBeTBvbjhWK3ppd204b0tjbitX?=
 =?utf-8?B?azJ3TG1taXpzak5hazdaOVdySW9xRUdnMFM3SFhoOVBaU1FnWmpvdFk3VjNC?=
 =?utf-8?B?cVBXdUYvWmg1M2g2Q1BCajhMMnRRekszaktKVUVLZ2tLS1hzZ1pRTDcyZjFF?=
 =?utf-8?B?TFphUEwxZVJHSkE4VVNLWjZaQkVPdlNCZFRPV3REU0FlVGwxNFR2YlBTYnlI?=
 =?utf-8?B?bmNhL3d5bHlVa0FNcTFDVWtxbVFFNDEyNVhWUnBqZUhQeTFUMjIxOVBpRjVl?=
 =?utf-8?B?bkc3UUJENkM1ZTEvdFd3S2dLcFVXaEVHUTVOS0RJVVpTbFRrVk52RHRZVmt2?=
 =?utf-8?B?VUIwbUdUeHRHSXNadmN4Mzc1V1pnSVNMM0p5RTJNSjlxWXlqVVRuMnZralFB?=
 =?utf-8?B?NDNwK2lGRG9ETkVyQ2YreEs5ZkJsaS8yQytkaUVlTXAyd3Q0WXFPbnVtbDRn?=
 =?utf-8?B?czdEM01KZ2hCbk5CK3NXMlUvRjdYYlIyRDZRSzhmUXNMdXE1SjZFL0hsRmZV?=
 =?utf-8?B?N2k3Vkx2WjJKNjNwOWxkY25XQnpXZDV5VVNkcTY3ZUozaXQyOER2cU40SzRn?=
 =?utf-8?B?cUloc0JHTnp3L25TNkcrWFFxYW02ZHpQdnp4QlRHOXZwT1ZOR1d3ZXd6ZnF0?=
 =?utf-8?B?eEYyWVIxRmMrUDRsbW8venYrLzFlWVR3UFIxQ1pCS1JiUW43MXNEQ1h0QWg4?=
 =?utf-8?B?M2hrcTRRTWxHYk1XR0lCdjJQMHg1S2lka05rd0VhNzh6U1BJMFhCeG16T2lr?=
 =?utf-8?B?WGU5YWFld1ZQN1U1UmFNMTdSYlhrZ2YyS2dsMEdJZFBwK1JMNjRhYlZQQXlK?=
 =?utf-8?B?TUtuUUFyZlladDlKS09LYUl6ZDcvS01kc2poYVRncGlBVEFFb2phNVFGYXc2?=
 =?utf-8?B?UjlDOFNSK0pCcXc5NWw1MHp1ZGtmRVZIUE1CSkVJaW9LcW85NlZ1SnVLMjJT?=
 =?utf-8?B?V00xZkRYWlplSGRWNGU5T1BxTmJRRnpGTVFsZ0xWREdFK1JNOHlIMDNjT3py?=
 =?utf-8?B?ZFZydFNTV25DbkxwamRQVTZuTThlOUNNUStCSE9UYVZpc1AvcnJoQlRpMFN3?=
 =?utf-8?B?T01aRDJiVmFnMVprbTMxZ093K2pXT0E3LzRneXN4OXNyT1BkWmZMUGVvQVZV?=
 =?utf-8?B?bE5tQlRiMzN1eUN4Z2kwbGtBNUo1OGR3ZHZ2VDVMcXgzM05pWFA4cytMd1Ur?=
 =?utf-8?B?Z2VtN2ZWSGx6TlYrc1Q0NFRRaHBuZVJsc05FNDlqWjZGS0VzNjhZTDFoU2RR?=
 =?utf-8?B?VVY1OHJmaDdpcVVLMWNYdTMwNXVPbVhLaW42YkZYWUdWVlIrbDhPZlpXcFVW?=
 =?utf-8?B?ZGlJc0k0Y2g3VGl4NkdLa09ncnVCOUFiR3hiT3BJWVFhQlU0UHZ0TlRveHgv?=
 =?utf-8?B?V0M3dHNIcnJzbDVXVUY2Q2Q5ZFMvdkRCY1F2WFpkdXBqWmNOV1R0TkcwV2wx?=
 =?utf-8?B?VDhVNEcwMGtTWXFnTnJrcDZCNDBXOGlhM0wwRDQwNDBkbTNTOTQ3TDVZOFVV?=
 =?utf-8?B?OXNJSk9FWGtaZEFoLzE5WU1pbU56UmxNbi9VRUhGaHB0aW1UcVpxSUZtVnkv?=
 =?utf-8?B?NGp4SHZlZnRJQmxNSmw0QjZGdmRqcGdpNFRqMWxpM3MzeUZIQkN3ck1PV3Mx?=
 =?utf-8?B?cHdac3hMWEppYmg2bkxUVDN4eWZBNWQ4QTlxV1dscFZiMjJYQWRJbWpBUjBK?=
 =?utf-8?B?alhVNlhDR20vVGJQVHY3Q0dnRjJkMXV5Yml2eHdtLzdCMVNZSXNIc1h5WHlZ?=
 =?utf-8?B?NjhZUkUyU0ZmdFpPenJRRmpWR2cwZU5GZ3pvZ1ZwUGVnTnNRTXZraFBBZE95?=
 =?utf-8?B?N0VjY01hVFVFcHJpdXRlT1hCL0tVQUVlMzJCWVNzU0t1cGJyamowRGFmOUUr?=
 =?utf-8?B?c01KMjljdVJqeXZHNGFYQjU0YjF0WWZoUFJYSmNQdjhuQnU2ZTcyN29jbWxi?=
 =?utf-8?Q?lQQxn9Fhp/c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cTBOKzdnQnU2Z0lkMmFyRnhHeUhtN3k2MUl1dEpGdTNGRVBGSTlndVMvd1R5?=
 =?utf-8?B?YzlwenJ6blFBT1l3VHhIOTl4aXYwYS82UmpoNTZzeWdwU1RaVmJFTm82OGYw?=
 =?utf-8?B?TjlVQ1RDR2IvczBGUmhoVWQrLzA1NDFOM29PVTFzZ0JEd1MzT0E5TnFDejBx?=
 =?utf-8?B?a2Q2SXp3K0ZIRmM5NkhxRGUzbmtZR3QwV3dGdy8yeUh5OEI5cWlpaGZiWUUy?=
 =?utf-8?B?S0VFY01mNUlad0tWWjRld1FLREg1V3VFRmNXMmdpV0F0OEJ4Y2xnVE03Vk9K?=
 =?utf-8?B?UEdCZ0FGV2RCbk5VRTFEbUlIcURXL0tXV3JEbzdtajRsQTdwTG80UzhHTXgz?=
 =?utf-8?B?Tk5GWGQrbjJuNXd2MlVLTDNIMWM5YlozRlpoaEFvODc0SDA5WW1BNk95T0Nj?=
 =?utf-8?B?TDBpald3Y2o2cDJvcWpjMGlxb3hDczlrYktOd2xrNndkYTJmZjhJLzFuWEVr?=
 =?utf-8?B?WHVzV0lHNGtPV2VpNEFUVnJVZ296OEthU1dkekd2UnV3NExXak41c1ZXOXNo?=
 =?utf-8?B?UkJvVVdLZ2M0Mi96VjBjWnVCZWVOZGgxdXRtU0NFcDVZbUF4VWluWXdHSlQ5?=
 =?utf-8?B?WFNsMDhLSDdOeWFaZnBuU3hVbU9DYktLS04rVDBPL1NOMG5abnBNUUdKU1ZN?=
 =?utf-8?B?UWdtVDVZRTJNa21Ib2llWkJlS2NRUEp1OVlrV1NzWktNR3preUkvZGhLNHF4?=
 =?utf-8?B?L3hpVGRuKzNySFYyS05LK3BRa09CRncyd21odzg1VWs1UVE3UUJsUXpVT2Vx?=
 =?utf-8?B?a05TVE9XV0NYM1E3dUNoT2ZKTytISlczRFY3SWtydmZMY2hydlNnelJWSlo3?=
 =?utf-8?B?NE1UdDYyQ21ycy9sTGtRc1V5Tm1pdnJjSWYweDViR1ZkdlVURExOcXBYaVJC?=
 =?utf-8?B?WWpXMHhsL0tFTlRvcThML1BTTlg2Y2hhZ1VKSXpET3ZGdmt6NlMrU3F5Vks5?=
 =?utf-8?B?bnMwamtLbzhyWE5ONC9vNXZhbmF2WTBLbWhFTUdBM3E4am5pYXFIZFpQS21E?=
 =?utf-8?B?ZHF0TlBSMGYwSkRUaFp5ZXdpZmVpQ0l0MFhZYlNQZXNpNldFZEpOT1hKdUpO?=
 =?utf-8?B?SHIreWMxSkg5YTI3SDV4akZoNFBEOFBOTG9Bc3hxWk5LbzJwb2c3UVZkZGh5?=
 =?utf-8?B?WFR1bFhVNkN6THNJcTBTVzFoRmhYdk9meExsWVRtVkhHaGZtWWh4K004dStU?=
 =?utf-8?B?SEZlbWxNMjZ2M2kvSHR5ekhVWGJ5ZFFxTlp6cFZaejBoNzN1K3BXdTlLaTlp?=
 =?utf-8?B?OXpiRCtreFFlVHF0Y1BXK3lOTVZsaUxoQnBDUjcyWlg4dUlXMytBWUd1V1BV?=
 =?utf-8?B?UDEycmRDTWh1QTRxMW5vQkRXWHZnZHlaOC9DTStLa1lUMUllOFhkb3l0UlEr?=
 =?utf-8?B?cXpMZ1FxcWpZTUxxQWdGNVJ1RVBCbmJoVkU4aXd0bzN2cVU3Z0x6dDNydDcy?=
 =?utf-8?B?TWdZU1lJYytwS1VmNnFBSGc1bHcxakVWQlFNUWw1QVo3aXJZV1RwS0dKdWxE?=
 =?utf-8?B?SnVaQ1RGc3M3S3ZXYmFXZm8vMEJDVnJaeWNzTlhWUysydkdJOEJpOWh6MDV0?=
 =?utf-8?B?MDQ3S3hIY2xQbHdPeGNOTHNxd2lEc0hrMjRrc0ZOTFNCemM2R3hZRm5wdG5v?=
 =?utf-8?B?bWJhWjFtS2FwNldmWDlWZk9OcUplTFdVOExPV1d4YzhpeG92NXFNVm1LU1lI?=
 =?utf-8?B?c3hQdEJVT01IRmJtZjVTMzIzcmVRd1JkZjY2MmkrbVovdXlZMWVlTmtVUHRk?=
 =?utf-8?B?NHh4Qmd2Tng0UkoxT3M1d3oyTGtTUzVRVWlyek1NeUt6aE1aS1RwcnI5VzJO?=
 =?utf-8?B?eVpwWWtzUC9xMklrNFZJQVBtVzFvY05kMW5IV3hyeUdGdm5rbVF4U2QvcGlW?=
 =?utf-8?B?YTJ5OCtZT0laTTlVc0w3ZDVrc0ZXRWk2c1pCMm5ueFBoU1VybWo0TDFWL0JD?=
 =?utf-8?B?aEdpbDNFb0J0UzBENWVMcTNIem81bFY2TXVvYlhQZDRvajZZN05kNnU2alNZ?=
 =?utf-8?B?WndGMndUUjF3QWFmRU9xSHJxNGY4SlcydFY0aDVaTW5YQmJoc1BNYzdWKzFp?=
 =?utf-8?B?UDBwdlpDeTdlYU1vdmovbU9rRTZVRzlXbm5IQnpMdGZSWGVUQmJWUUIzd1NH?=
 =?utf-8?B?ZWtQRXBRcTNPWEdXOHBuTzlSWjQvN3N5c2owWFAwWjJ4ZG5ObkFaR1EwUktO?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a72e7e-50b8-4b7f-8298-08dd96c48d8e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 11:01:49.0585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8pc8MtffOUOzhsK27S7etGxSsPdbJQ4dCLO/1ypTFxMMgfP7ZRt1TtvEFlohmP1/whl3wCUooe2I3NXjs++27F+LqZsgeKcR4qX4mpxdzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8595
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 May 2025 11:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6839

Hi Christos,

On 5/17/25 4:49 PM, Christos Gavros via lists.yoctoproject.org wrote:
> This variable specifies the maximum allowed size
> of the initramfs image in kilobytes.
> Fixes [YOCTO #15797]
> 
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> CC: Antonin Godard <antonin.godard@bootlin.com>
> CC: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
> v2->v3
> * the text is wrapped in less than 80 characters
> * the syntax for hyperinks is used for variables
> * the syntax for path of bitbake.conf is changed
> * the calculation steps are moved in IMAGE_ROOTFS_MAXSIZE variable
> ---
>   documentation/ref-manual/variables.rst | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d17f81036..33934c8ff 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4708,6 +4708,20 @@ system and gives an overview of their function and contents.
>         See the :term:`MACHINE` variable for additional
>         information.
>   
> +   :term:`INITRAMFS_MAXSIZE`
> +      Defines the maximum allowed size of the initramfs image in kilobytes.

s/kilobytes/Kbytes/ to match IMAGE_ROOTFS_MAXSIZE (though I'm wondering 
if we shouldn't rather say KiB to highlight those are 1024B and not 1000B).

Replace all
initramfs
with
:term:`Initramfs`

> +      The build will fail if the initramfs image size exceeds this value.
> +
> +      The initramfs image size undergoes several calculation steps before being
> +      compared to :term:`INITRAMFS_MAXSIZE`.
> +      These steps are the same as those used for :term:`IMAGE_ROOTFS_MAXSIZE`
> +      and are described in detail in that entry.
> +
> +      Thus, :term:`INITRAMFS_MAXSIZE` is compared with the result of the calculations
> +      and is independent of the final image type.

Maybe add "(e.g. compressed)" at the end of the sentence to highlight 
the typical confusion that will happen?

Looks good to me otherwise!

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

