Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BFDD0C85E
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:04:43 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61168.1768316679018374605
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=e0HBxdKa;
 spf=pass (domain: cherry.de, ip: 52.101.72.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcEVreWLVOXTdo4C8XsaE0aujW5GyJjdkl7lesX54Se1b12wmTFpkYgZxtSKTzE2NlkLCLI0p2TueGMKo8qYGMmStdZAJl9kLWtbjenPN6eyPHPig14JprKTDQqdg/HrwBsTgu7yEvsAC/QO0OcT4zQdKTXFpte1Ia59b9s24NDJd0v8kkhZ2dIhFHMgKWIb04RUMOkqXC8ORJFrXveYqGSzAi7ObVTjExyrZGS8vsLxksYaZ+xxnTyKwsUW66dCFOyDGOh8CLILKAel58yHYnbMxJUbmn/ycRUb9U2u8H2InJBuhUFfz9zq0T8oSV+xH+kuOV8/ADvEp8ookqJgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Es6PCwGycI7ZcCTJt6+FVrVyXnezECvf+OKf7k78oE=;
 b=q4lWOzLBzHtqCyltQQNQQtMeaP31oai3eOtV1lOnMSMu0gqaHjdW+04JtbL/tXYgPIDAokQqBec2SiMkXWaCzsiLgNWXSu6ZtSw/AXDFsj95nS36laE5RgbCBO503IzCTOvP1c41banTBs8ieLxq3LKCqd+XIwkpJsfg1yaae90uZB/aIDXIRfzERgSUQTfUR5ZT9RVPA+Gb7sNoW0QALZtKWTv+6VZVScKWE+Tg6RvOKgGCd+cU24D7EjMsqSZZHzPlsIb0tmhwWgokqLorinoDuG87zAM109qBntUgNCmkKQdz+OpL6S3VUbB4rksjlk2+ROkfH8+FZsfUysGWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Es6PCwGycI7ZcCTJt6+FVrVyXnezECvf+OKf7k78oE=;
 b=e0HBxdKaRxsKddMhlWe8R8VJjPS8W/XagqOGBT3vSN0bDzOESDUOsIXjzWbGAx3yJawOXkfUgbnL7qVeslJixPM+veWCRsYMsXtZco4QHuesSPxTGwmHWKnUWavmlLMtCpMxJ08P07K2DsnL9voCM0pmemdcyhe0VNbYJ8vvmOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB10401.eurprd04.prod.outlook.com (2603:10a6:10:55e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:04:32 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:04:31 +0000
Message-ID: <c1318226-a1d9-48d0-ab12-56ebd7b32245@cherry.de>
Date: Tue, 13 Jan 2026 16:04:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 39/53] dev-manual/licenses.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-39-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-39-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB10401:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c512fe-2a6e-40b5-ded2-08de52b50e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|41320700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RzFVWFl4SXNJcDRkNW1xSG5vM2hqTmt1NGwrV2Q2WVFuWkdENWlZbXVXTVFD?=
 =?utf-8?B?czVHc1djUlluSDRUNlNJd3FDcXhWVUpURXFJL3BucWdEVFNwYVMxUng1cGRY?=
 =?utf-8?B?alRNNXlIS3YvY05HMWQ1N29POUltcG1sc2tibVR6emVZamFCbzB2bkJWWHVV?=
 =?utf-8?B?ZDRZVkh6OXZ1dm5GeGtoL29OWm0zc2lna2h0WmlLZk81cXdLQ0cxbllOWFZq?=
 =?utf-8?B?Q29TZmIvZGVGZW5rRm96cllFblNMd3JJQU5Md3NselR2TU9kWmRGbnpURVZu?=
 =?utf-8?B?QjJXN1VuOE01bnArT2JYQUN3REJTYU9tdDZ6SkRIMVFMQ2daV1hGbjY3SjhN?=
 =?utf-8?B?TXVmWVdZd0pOUmhHRVJjbGpYTzJRMEg4bDVBRDhEMjZWT3g0R1BYTkFpODNM?=
 =?utf-8?B?blhSS3l0ZTRVK0RNNENYejFJd3Z5Y0FXbTcwN1lyUHpBZ3YyVUl0VFlXUDFt?=
 =?utf-8?B?R1k3NXlSWGVsVE9YOEtxSlVicDdhRmYxV1IwdldhQWpFbUg5bXFDMFZYSnhQ?=
 =?utf-8?B?OW52dEhxZ25uYXp5aGRYaUNPOFAyZ0FTckM0c3FaM1NhYnlrcFpCd3ZSUDY0?=
 =?utf-8?B?RGE3TXM3WHl1a05EWGpCWnpyWlBMRmRvYS9BZmc2T0NURGM1ajJrOERpSlNX?=
 =?utf-8?B?cStDOFFzVVUvOEZyUFJpbFgxeFN0OTVDTXRMbEhlZ1hjakIzb1JuZ1kvRi8y?=
 =?utf-8?B?UzQ3UXZsVkpYc3JMeDNJeGV6NzNaVkdtUnNURWxpNnNXZE1oZXVycTJadGdt?=
 =?utf-8?B?WW13U0RpRTJOL21ZSm9JY3h5V3ZuZU5tQUxhcVpBdHhFOG5POS9BaGZMV0NT?=
 =?utf-8?B?RG1DRGFqbTBMS1hXbW5yQmt0NXJXeFlLVVNtUXVJYjFhQmRHT0M4a25YV0pu?=
 =?utf-8?B?WFdmRUdtdDNEeXc2WEFtZklxS2cwU2htOUVqTDRBOUlsT1dZUnMycFpMdkdq?=
 =?utf-8?B?ZGFPZys4UU5aaXc5cWZHWTlnWE5qTUI2UEx1YkRTa3hNdnBKN0dsOXhLWVVL?=
 =?utf-8?B?Ymk1NlhpWU5vZzE2SnVrUEJSVlZJclJSckR4M1o4Qktsa1FnazkxL0c1Q0Z1?=
 =?utf-8?B?U0hNYmtpcU9HQnltSjh2VmNMKzQ0V1B5RmdJNk5NSndZMDlsQlJqUjNFcmVn?=
 =?utf-8?B?RnAyVTVidnRSRWxKMUJPSi9obEFiUDZoaTBmUGZXNC9mZEJmczVrWlhZUzhB?=
 =?utf-8?B?bmtRUzJMSmNCR1hUYnIrcHlpUXFRQWhVemphWmpqaDhtRDJZdzZvb3JCSVVY?=
 =?utf-8?B?K1ZHTjYwTVpNeVV1WVJNRWZPbFRJdzJoeDY1Si9JU0NMYy9IdzQrMXVMZ21G?=
 =?utf-8?B?MWpwMFJjeEhWcDVQVVRQRjk3cm1TK1oxVTRYT0JqSEhpSzhja3kwOUliMjd1?=
 =?utf-8?B?Wnl0NWt6SVpYckpkdGpGKzRNSGY4OHlLSDNLbUZQMGxYWTgxbmlMcHo3NVhl?=
 =?utf-8?B?REFEUjE0UzVEUzJBM1Q4ZXhvOTliZkJYRWw2QnNsVEZ3WW9rV1UxeE9IQWsw?=
 =?utf-8?B?OXBTcGhCUVhnRnNFcnBGUWs5cDQyTDNyZG9RVkN0WlNTVXVXaThhZzJkdmdG?=
 =?utf-8?B?VlVGTTdFdmhrL1RrT3dXWXc4c1Q3eXVOWERiOHd2SjFVbGZCdGZiZk5ieXlk?=
 =?utf-8?B?U3RNUExsOWVNQkFBSWc0b2RKNG1sSTNuandaVmNpMFlja3NDbEh2VzhXMjhU?=
 =?utf-8?B?aWhrSFREeEdCb2x5VUp6U2FsMktqMjdtekYwcmtpeGZDUUVCcEtnN2c4a2ht?=
 =?utf-8?B?dXNBOUtXbGl0eWF3eE1lYlJuaUIzSjBReGFxVFgwU3dKTHgrM2k4MGYyZFpm?=
 =?utf-8?B?TnpYd2F5VUl3Wm1nVzl1aHp3NXNZeUlJUUd2dHFUQklUZjJudmh2WFByMjhY?=
 =?utf-8?B?eTJISkhZODNEZGFvRVhYa1Z3TnJCdk8wc1pvdGpoQTdqZVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejgvbVJtRC96cU84YzZIc0F5dEpLWnFna3VlaVFhRlBOWk4wTlBqQjBnRzcw?=
 =?utf-8?B?eHRSRlA2ODRBcmdSTUk5RndNR0ZIMmdreVlMQ3psakNCQmNkeHA5Y1JMU0Rh?=
 =?utf-8?B?ZUtaWjg2QVEreWhhWmdIbk5ZTG40WWJnU1FZVzJJWVI0NUNtNE42T1BuUUdT?=
 =?utf-8?B?aWovVDBPRzJVeDRXN1NrMU4vQTJOR3NkYXdnQW1WRDJVMTBLNkNuQUEvRVVx?=
 =?utf-8?B?VlB2Zjdid0tyQmtUbUJJMTV6ZVA3VGVwTkh2WUxvc29tcGFnVzU4TWE0MXI4?=
 =?utf-8?B?MXprc0tXUExyeWxoNG8xL0NIVlFQOVBqN3d6WWNvYmNLSkJWK0tRYS9rRDho?=
 =?utf-8?B?S2U4S2VxWnpzWm9iQzJsSVBQZ3FjRE5XWFZYa29ONlMrTGMySWZOUDMva1BS?=
 =?utf-8?B?SWE2WVJnWEIrMUxkcC9aSkh3Tk9SV1hlY0NDSW9SZTU2SU5saFdtUTVSNjFy?=
 =?utf-8?B?K3Z4TElTVkY3K1dtZHpSbzdxcDZ1Z0xmNEc2b0c2Y0NUaS91QUlEWXlOdTRM?=
 =?utf-8?B?SCtsbzlWdVdzM3V6d1VibXZUaXFzVDJCbGE5MmhZbW1TcDM0MElYc21LeFE1?=
 =?utf-8?B?THdqUWc1dlBhd0RRRmd1aktFMTVNaFV1NUZYam52MEZMc3pRUnJrbEszcnpw?=
 =?utf-8?B?RSsxRGxuNGJKaEhZaVp3ZFJGSG41M2I4SElZY2ppb25OOVdENFVsTXdTbDBD?=
 =?utf-8?B?ekt6Z2VEVXZ2Z244R2hIN25WUVd2azBHcloza2tNNW9Ja1NGcTRWcWJ5Z3N2?=
 =?utf-8?B?MXJiYlZtVm03REQwZzYrb0xoeE5YTlJlREJVZkwreEQxbHRWbzZqbHUxSDBG?=
 =?utf-8?B?Q2c2YVFQOFVvWlZpVzFwTHVuV1llNmlJeE90QkErbWFXb2FyMEpsQXlRTjlX?=
 =?utf-8?B?SFljcVRYaStZMjZBU3lhZmVteUwvU3JwZFB1SmlhTjFESUxHTitySloweVVx?=
 =?utf-8?B?VnMxUU0xUnhJV214eWQxa1hPUGM4cjBGc3FLaDlHM0pJdGdiWTNOWCs2Um1N?=
 =?utf-8?B?bVFsZjFuSnFPM0hwZHlDZS9KamMxQTZRUHJ0SHd5L3MrbkRiU1JCWWFQVXZq?=
 =?utf-8?B?OE45SGVScmdzZUZBMHA3ZksvOHY5QnhleFdyQ29ZMk5BNkRiWmoxWU1aZm5z?=
 =?utf-8?B?TXJPZ2FKUmE1Z29nOUlnUkR4Tms4ZGZweXRSejdyKzdEZlJ1Vjl5QllHNTI3?=
 =?utf-8?B?TGc1dlFmNE9ZMG00S3V1UjJpaWNKLzA2RVBFTEJzNFNpTmp1eUZOb2VvR0RD?=
 =?utf-8?B?KzY2U08wcldia2JMYXB6RS9WQVR3Q1NQTTdRbFZ2WDBGaTlUM2JVeG9BK2Jr?=
 =?utf-8?B?OG95VDJaU0xWQXI4anZyeFdlYnBTN3QzQkUrc2wwWSt0LzdMdnFlYlh6bHBv?=
 =?utf-8?B?RWN5OWg4K2NFRHJLc2xLbC9sMllLZXBvZ3lXeXN0UDkrY0JNWkU1bGFYRDVx?=
 =?utf-8?B?cTFhd0hhV1VhNGV0R0ZSM3IwM29CVG1Sc0Q4UjREWkZEMDVPbXZmMmU2aWNU?=
 =?utf-8?B?aE1NZUhBR1JDZmdrYkcrNDVDVEVFL293MVN1bWRFd1lNUzgzdnVzN0U5Ump0?=
 =?utf-8?B?NUZqdzJCV3FuajRiUmZTT0s0V2NWZ2pMWkxrb1pwYTJyMVNyblBlL2RVZlMx?=
 =?utf-8?B?S21kdjhHbW5OQzA5WHRqaEhxNUl1Nk82MXE5RUZYTHFrVGREbUNESEhlLzBJ?=
 =?utf-8?B?K1Jra3FlWUpBa0lPNHNlTjdLMFR0WHg1QXFzVUR1Qk1sZllTZHE1YWdaYzRZ?=
 =?utf-8?B?RXRhdFRwVkFjN2dHY1hUanJKSWJTcWJVeWZ2aDNURG9TZUlpcXNCdFZiK1JP?=
 =?utf-8?B?WTlMTjh5VmtzZnNZcjdmRVFqSTdlaE56WWdzNnVGZnpkK0xhMEE1ZzdqUDFV?=
 =?utf-8?B?WGJOek9Gc1BqU3E1VXhQNUtuUWFpZU5mRExhMUt0ZkhSVmgwREpMbnNmak9H?=
 =?utf-8?B?YWpFenVJd1BwaFRGZ2ZmQmRLQkdrOTkrQXBrem8zKzJrZWhFTDVjTnM1ZUF1?=
 =?utf-8?B?QzV6aDRkYUh6ai9JSlVTb2Z0c0RIbUJrMVpyZnk1YnFteWZ6clFrRVZTRFFj?=
 =?utf-8?B?V2I1RHI5Z1VRUFJpdDdsK1cweGxDaXdETHFFVm5GMTZYaGRQcCtFbW8raDhM?=
 =?utf-8?B?MUU1MEE4NDhVTmFsSG1lZ3ZuY2FCbzdsMHVUMWg1di9hL1pBbEw2cFUwcS9y?=
 =?utf-8?B?N3pTYlRKeEVpYm5hNkRBNGEwR3ZNeENTTUpxWE5DMUgxeEtnRkRxUWwrWndI?=
 =?utf-8?B?MG1pMTdZeUtwY0pLNkFvNTQ1NHVTNHNjaUlSdS83bUoybW5HaEM2NVZDZHF3?=
 =?utf-8?B?c09KQmRVUGxPTkQ1bFdIWHNVVmdLTUxTbWlhUmFFeXBrQ09mQWJqZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c512fe-2a6e-40b5-ded2-08de52b50e71
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:04:31.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAhr3V7uS2LVVM0uyEqJ4+GFe6u8Y/BCSV1n2i0pNzqOJfs990S/K+2ymw9C9/a+6Eb2W09dMLIErOcLWdo9kw88e6T4fcYRSdujXS2fwZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10401
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:04:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8528

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/licenses.rst | 28 +++++++++++-----------------
>   1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
> index 7d6636eef..edd503bd6 100644
> --- a/documentation/dev-manual/licenses.rst
> +++ b/documentation/dev-manual/licenses.rst
> @@ -112,8 +112,8 @@ commercial or other special licensing requirements. Such requirements
>   are defined on a recipe-by-recipe basis through the
>   :term:`LICENSE_FLAGS` variable
>   definition in the affected recipe. For instance, the
> -``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` recipe
> -contains the following statement::
> +``meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` of
> +:term:`OpenEmbedded-Core (OE-Core)` recipe contains the following statement::

"recipe" should be before "of OE-Core".

>   
>      LICENSE_FLAGS = "commercial"
>   
> @@ -136,7 +136,8 @@ needs to have a matching entry in the global
>   :term:`LICENSE_FLAGS_ACCEPTED`
>   variable, which is a variable typically defined in your ``local.conf``
>   file. For example, to enable the
> -``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` package, you
> +``meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` of
> +:term:`OpenEmbedded-Core (OE-Core)` package, you

"package" should be before "of OE-Core".

Isn't the package named gstreamer1.0-plugins-ugly? c.f. recipe 
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb

BTW, there's a "those those" (newline between both) in the file, 
https://git.yoctoproject.org/yocto-docs/tree/documentation/dev-manual/licenses.rst#n462, 
needs fixing.

>   could add either the string "commercial_gst-plugins-ugly" or the more
>   general string "commercial" to :term:`LICENSE_FLAGS_ACCEPTED`. See the
>   ":ref:`dev-manual/licenses:license flag matching`" section for a full
> @@ -244,7 +245,7 @@ Other Variables Related to Commercial Licenses
>   
>   There are other helpful variables related to commercial license handling,
>   defined in the
> -``poky/meta/conf/distro/include/default-distrovars.inc`` file::
> +``meta/conf/distro/include/default-distrovars.inc`` file in :term:`OpenEmbedded-Core (OE-Core)`::
>   
>      COMMERCIAL_AUDIO_PLUGINS ?= ""
>      COMMERCIAL_VIDEO_PLUGINS ?= ""
> @@ -464,18 +465,11 @@ those layers are used to patch, compile, package, or modify (in any way)
>   any open source software included in your released images, you might be
>   required to release those layers under section 3 of GPLv2 or section 1
>   of GPLv3. One way of doing that is with a clean checkout of the version
> -of the Yocto Project and layers used during your build. Here is an
> -example:
> +of the Yocto Project and layers used during your build. Removing the Git
> +objects can be done like so:
>   
> -.. code-block:: shell
> +.. code-block:: console
>   
> -   # We built using the dunfell branch of the poky repo
> -   $ git clone -b dunfell git://git.yoctoproject.org/poky
> -   $ cd poky
> -   # We built using the release_branch for our layers
> -   $ git clone -b release_branch git://git.mycompany.com/meta-my-bsp-layer
> -   $ git clone -b release_branch git://git.mycompany.com/meta-my-software-layer
> -   # clean up the .git repos
>      $ find . -name ".git" -type d -exec rm -rf {} \;
>   

We should probably recommend using git-archive instead of removing the 
.git directory as that is destructive.

find . -name ".git" -type d -exec sh -c 'PROJ=$(basename "$(dirname 
"$0")"); git archive -C "$0" --format=tar.gz -o ../"$PROJ".tar.gz 
--prefix "$PROJ"/ HEAD' {} ';'

(not tested).

Cheers,
Quentin

