Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80264D2F333
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:23:43 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61277.1768317820216831929
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OXO0nknQ;
 spf=pass (domain: cherry.de, ip: 52.101.72.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPKhZgZnG1DEhwtIVcjJFP2OGDuStqp7Ub9UKBU4NHKbEF80q3tp/i4JI6a3GH9PTOj9UGf1eFU3Ky5riYdV7HrkJL3AelUZHvu3nF/PeJfyc5N5MJ3QRGKTWhs2bxxU5yAL6snOVa5g87+yESSEliro3nfaFfqsIaGBtcjh6XxInUjKQMgoVY4a2AT0pLDAUxX9Z/Ouz4TKxSlf9iZai5zSHUqf0tp3YzGBUWeCqMqM2clduSeuqJL+iJKQQJPGKbgfCHmCMPWP5nCSKUlpLp39pXq4r1Fi8wHtWstrZY2aC+O03cQrI3jkoWLBqf9Cm+snpUKovhOhah7Cb1ILxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISRc3yw9fSvDHY88pnNzt5yO9+O7019P5EWKJn5OS0w=;
 b=Vn19t4xRY5MBJ36bugh37cbzKkMFe/pIKjpHZqxznGCqUwWZngPS+LTwsboexBaajXSMjFcldndpOWRIpH3yF4g0DH4JrkOp0yVB5kE2DwrZy7Tqt/09tU0taRJ1DO9HL9VQcSLIlpkdhrFtEb9ouphkNlXF3T2mW+Uykx18QhJJIXMXBhTyrY7zuUoGa3RP0gfzwwXtQ+knsSSdqdnT+rTVrc9ZQ99KJGG9E3NHaP2X1M0l4FLumJ0CSZyso/RYJGKlmtuSbLk2AdD55XN4vvMlKZ1JxfwPIEw3EJ50LxPCk9ySICbqKDAHxjXaGp7xuZbSvxAwll/CZGpHjVG46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISRc3yw9fSvDHY88pnNzt5yO9+O7019P5EWKJn5OS0w=;
 b=OXO0nknQmbd0BcmZ4eO7EHeHOPwlBGNlBr5VAhstMJadtyus64diUFrxXSjUBkzTP1Mb556Zrx2iSzYZm9mIG+BDBMYFKIccA9HZLTZav55XdY5SaPS7Ew7sqv/m62U2deY7igq2Fq6GW/ENNFoduTdvXhiblDf+2fAdZOaOLNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB7695.eurprd04.prod.outlook.com (2603:10a6:102:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:23:36 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:23:35 +0000
Message-ID: <fe6dca59-14fa-4f4e-b78f-57379fe30e5d@cherry.de>
Date: Tue, 13 Jan 2026 16:23:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 52/53] test-manual/understand-autobuilder.rst:
 remove obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-52-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-52-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e34f08-9563-4b50-f0b1-08de52b7b841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WFc2cUJyMTN1Z2w2RkRIRjZwWmJZZDFjM1NhdDhMQXMzUjRseTdJYnlvMVAv?=
 =?utf-8?B?VkJxWFAwcjI0MlBKa09zbnp5cHN6SGJaUllNUkRPUUxkV3YwMWtCYm1RbUhO?=
 =?utf-8?B?L0pQMmdMd2Q3Sys0bnJUU3VHQ0x4TmdJTVYwcDBQWkxUOWVEQ2w2QjZyT2lO?=
 =?utf-8?B?MTNjc3ViMzc3dEhCN05KZmtCRXBiTkkvL1pZMlhsSjFJQUNHaEljQm5BM1hD?=
 =?utf-8?B?WHNLWTIxNGk1Z09wQzN2Y2tCU3VhVGg5VUlhdXVsdllJbmJmZWJaOXQ0L3pS?=
 =?utf-8?B?TGQwd0JyS2ZWVnB1eDJydWJPS0k3MUg4VjZFMzk4MXJhQ0dBVUpiNUoxVlB4?=
 =?utf-8?B?eVBycFNvT08xM0R5UEQwZ1ErcHdTaTM4ZlB4NUZWbVhERzRuWjY3dzlPTmpr?=
 =?utf-8?B?M2NQMVQ5SFdrNWJKcDl0UVJDUndmdjlEWkNCaXZFNzgxeTBvVkR1eWE3N1Uz?=
 =?utf-8?B?VzhSTE9mZUhQL3ZGTzloR2ZRRk5scGhwTEdyaU94N1ZhN1lhd3ArUEdkbzAx?=
 =?utf-8?B?czZYZWdhVnlBUEVNaFRrZUxFakNNWUllL3dNeXlNRFY1VGtuMmNLa2xZbERj?=
 =?utf-8?B?WnF6SXBtYlZSdENRYW9MUW5PamFVVTZ2S1ZvSXFEMHJOTndGcjVHelZ0MVEy?=
 =?utf-8?B?QStHTDNqT2tFdXpNaEZjL2pMZjlzR0szSW00ZzdpRG05UGZhMnNKL1hsdjlj?=
 =?utf-8?B?UWoydkI0NkplZmFLNGdOeURsc3pRVStkNlU0R2VuT3Bqbm5iTmhHS0tvZFZX?=
 =?utf-8?B?cnlHMHdOZTJPWTZxekhoVUtPVW8zMzVQZmF0MmpKbmNDU0JRRUJGTURCaXVy?=
 =?utf-8?B?SHMzTXpFSFY3a3A5K0FpN0t2SmxkdkVscnJ2Q2h6SHlGejZGRE56ZEtvc0w1?=
 =?utf-8?B?a2hHajVveW5NR2lubXBHV21sc1lwQklhekpRRkt0M1VyWnlFVmU3c01aYWhC?=
 =?utf-8?B?L1N4YzJ5VUhjQXh2OVlxZWdSTDlnR3RIeW54TExNb01XUUpVbFl6THJYakJU?=
 =?utf-8?B?T0x6K29FZ01kclFWVmdDT1NwZEkyVnVHWHBLUmJ5a1llakh0eU5waXV2Z3dW?=
 =?utf-8?B?V3JwN2p0N01JQmtaeG04bkVUb3RhUm5zQTdrd3MrM21rWWZieFg0c3gxRmkw?=
 =?utf-8?B?YzROSGQ5VW5ybS9UNW5OdEI4MGRMSGQ2ZU5kRDdicFhjSDdvOVduRStFbHFu?=
 =?utf-8?B?S0N2M2oxL01OQ2ZPRTkvSk1FcE13ZjhqN0U4YW95QnVnbWJ1ZkJrQTRsSkZX?=
 =?utf-8?B?VzZQUHNtV3N0d1pMaFBwRmtPVm5vTTMyM24ydEtTT3lYQklBN2NjL1Zxdkl3?=
 =?utf-8?B?VVNELzdnUERlckIyZGR3Q2hqYWp0RG15c1BoTitPai9LZ3hJZnczcUN2Ri93?=
 =?utf-8?B?RG1nZXV1dklyTU94bm5iK0cweU1DYXE4bDkrYndWb25iL3ZuQ3RLWE9LUzFa?=
 =?utf-8?B?dDNySVFIdkhVNkZsbnZuTlRXUGRZc1lXUHFCWFhUUHFaaDJXWkpBbC9nTmdB?=
 =?utf-8?B?SXhrUUpqMUN5bDRsUGVkTytQS0tCVWplUmRyMDR2OGwxQmJjeHQvak1SeDhU?=
 =?utf-8?B?NitVa2hiM051OWhTV2d3WmJickk4c2hNUDByRGJOQUxPbUVSaWRMSWYvcVor?=
 =?utf-8?B?ZUdCT3dXb1h6UnhndFh1SEJaM2RiRU5KM2dOUE8wRGozcFZYTG5OOCtiVVNK?=
 =?utf-8?B?WGhnb0tNTUpKSU1xQ0U5ckVWdUpENTJnTTVxR2Y2Z0tyNTVoTDUrSzdHSGtL?=
 =?utf-8?B?OWJrRm9IeGZxNzErVjRUZlNCRHZsblF3NXBROWNIeFZ3aExXYmxVK3djSVpU?=
 =?utf-8?B?aVRWY3dLaGVQWUxnNlV0dWYyTFBrU2RuTEY0RjU4MXp6cjRlbXJCYXhlN053?=
 =?utf-8?B?cnR6dUtRMHFZSUxuVlJsL2xSTFFKc1N2UzJMRDBqNkxiKzBNNlptSll1U1g1?=
 =?utf-8?Q?pQS1cVryd4Umt9Z35T9qUFiIKJFsUcFL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bUwxWWw3ZXhjdEt5QjV5S0VnS1FqTnI4TFQ2SkF6NlVKVkZRZ2hBRkFXRi9H?=
 =?utf-8?B?Z2NNODFNWUd5TUtxMVVrd255NWNDUVRnc25QeTU2dVhIYnVnWlNlNG8xTFFO?=
 =?utf-8?B?aUMxdjU5SHBSa0FYVDFhN21za0hKZEF3SGFlbTc4Mk9ReHhEaVJSN1JZR1pM?=
 =?utf-8?B?a05UT3VvMDJZandmNnJGWnNtRVkrajJ0S1ZPVXd3SGp2bUNiV1dSdUJiTkdV?=
 =?utf-8?B?dWx5RzJrejFBZjRjNi9ROVFYR2ZEbUI4Y3pDR2kxL1JBMlgwZjA1aGdMRnhq?=
 =?utf-8?B?OTdUZXFwYnZ4QjBKRDhFTXp4amhpYmEveUl0YW14WDd4dmxOdkM4cnd0NTFy?=
 =?utf-8?B?NGpraS9IcDQ0WUFBZGVBVUR4ZE1KdHl2ZzFXM3Nxc2tvYWhUN01pYXJwVWtJ?=
 =?utf-8?B?cVRIeldpK2RSMGZNL2ZQTkJrTWF6NVZ3YXIwNWVtUGhlRnN3MkNhV01mTFN0?=
 =?utf-8?B?Z3RvbjBqODNRbG1oNW9qSzZwL3ZCZW1qVTZCdUxwNTAzanNkQkl5anhrUFBH?=
 =?utf-8?B?WnVMbUllYmRLUk5CMnlVU1F5NFZ1MlRJeXJ6enFnV3hrN1o0bXIxM3dUWHJh?=
 =?utf-8?B?MC9uVCt3T3ZoNjBSOVFHMEg0aEVsaG9ZUWlZZXVtTllMak4vSG5uYWMrMjdt?=
 =?utf-8?B?QzQwdzJhMkNMQnhBbVRKSjlNb0xRdk1peC9rRVRqa1ZWY1Y5ek1kN0JoZ290?=
 =?utf-8?B?WXRsd21nUzFRR1RtSGI2ZU5DWFF2U1hBVkR6N1cwRDdPMzJnRkE4YkFBZTN2?=
 =?utf-8?B?M21mQkEzaE0zeXF0OWVnYXk2MVFTTlRvUmFwQWpzcG1mbWJIQTRxODN3M2RP?=
 =?utf-8?B?Tjlmb2lNNlRoS2o4bHh0ZllGKzA4Y0lUL3huQmUvTy9NcUFxaC9MQW5talVv?=
 =?utf-8?B?MURUSGFDZjAxT3NGY2lNZ2ZIU1BDRzRWdGJLZllyR21SLzkxNU5MZ1RFNUU1?=
 =?utf-8?B?NGlJUVZBUmJYNFY0VDNEdkE0R0tGVUxRZDJrbVJZMnBUU0t0eEhQM081cDho?=
 =?utf-8?B?WktrL1lZTzhCMWVkVVhqZ3U1YmRVV0JhNndDa2x1ZENEOWloSFlOUXBoU3l2?=
 =?utf-8?B?UWp2T21FQ2ZzNHpOQ2NtSHhZMXJRZXhRemsyNG1YU2w1RVdqNFhYOGFaNFAx?=
 =?utf-8?B?TkdOVG9RL2NvVUFVQnlsRUNRWGs3a2hPTjZmSUcrR3hIem5xOHVNWUpETXd2?=
 =?utf-8?B?eXh3QlBrT3o0L2VqUnpXYS9yV3JXUUJoTE9EdFV3WWNFREVQdUI4eU9TY1JB?=
 =?utf-8?B?Vm1QMXVRVS9aWXd3Z0dMOS9RaTdvaHFJK1VlU0hYUEt1ay94MmRXcmtjZHRV?=
 =?utf-8?B?QUFpQUFDbndwREhNR2RReGR3YnR2MW5yWWRwUldsZHhrLzdwb1dTNXlNNTQ4?=
 =?utf-8?B?RFRZYVZkdWJyVGNVYzFvYnlvdXhSQkRkUmR1WDVNNWNNWjFlRUlQK01VZzgy?=
 =?utf-8?B?a2RCcGpWa25FbHBHV3AxbGpZQU9KWlk0TCt1N3duejdKdDBOUk01SUY0RVZR?=
 =?utf-8?B?MWV2NzdpRksyUC9LTXlDOUxrWFgwbFlVdVJwNXFJMHZ0OUJ4ZklhUTNwM1Fv?=
 =?utf-8?B?SHFrckpIOHNqbFVtaEdwNXlDdEVkeW5PNVAxTFJGbmpGcmFBZDRjWk9UL21y?=
 =?utf-8?B?RzBZMmNkRXdmVWhzN1ZFdHRqa2c4cUl3ZnVoZmd1eUNaRHRaMzdWbWNUVTY4?=
 =?utf-8?B?RW1YclhxZkY3S1ZFRC84Snp5eTVTU1Mwc1U0aWhpR3lwdnV5R0U2c3F4NGVE?=
 =?utf-8?B?TWU4L2dla08rY0pMYk1WK0xScW1iUnN1VVI0R1JFc1NEN3pyQjdGZnBVK2JY?=
 =?utf-8?B?NndRV29zWWJZdm5weTBCYllPNDZkSlAvM1FzQVh4STE4SFhBamZCMVlWNFpZ?=
 =?utf-8?B?MHJsMFg5RW5pWmdGUmxHQUlCRDNKNSt2SXp6WEdHMzdOYy9mYi8rdlFBUkI3?=
 =?utf-8?B?WU1PSnRaWHVrd0IwNWwwZ0M4TENkU3AvMDhPU2VWRjJJOHJsTVpmQWdvRkRE?=
 =?utf-8?B?UUVvVHVOS2NKeWs4UjJnWmVhWk1USURVcGkxdFdEVzBNemV5WXNWZ1hueUNR?=
 =?utf-8?B?d1lWREZBZTJmWWgvNjUwYmhEOXZmbEVLYVVvV0E0TkNJazIxVlpKREZYOEox?=
 =?utf-8?B?VUZ4b2tIdUVUNE8zWW1ES2g1U3Zkc2JObEc2Rzh2QWpxU0NEUE51WlJEUzFm?=
 =?utf-8?B?N3g0UkE1YjRzQlpSRDV2UmtDWEcxakJPeTVETzVVbDVkb0pvVmJMRGwwckIx?=
 =?utf-8?B?eDl3QUF3a3FuMVVLWE0zbjE4UEVEZ2IzcVdrN2xhcjNCY1hlcUtLeExZZkpq?=
 =?utf-8?B?NXFZQWJrdllFZE95c2tNNVFSQWNReFlsWVBiR2d3aUwyMllPQStNQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e34f08-9563-4b50-f0b1-08de52b7b841
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:23:35.7889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZLlHtqSZ0j+W8GwtJLiLoNCHtYgmEatJT4vlq9mW5VsnaCqZS1bsC+cHsq+TSeyDO/WoKigBfJwMe8Yt8UR1h9VJodu/ko4KamnYG2eKvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7695
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8541

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/test-manual/understand-autobuilder.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
> index 23b3ef7d7..2b5eb144f 100644
> --- a/documentation/test-manual/understand-autobuilder.rst
> +++ b/documentation/test-manual/understand-autobuilder.rst
> @@ -104,7 +104,7 @@ roughly consist of:
>      This is a call into the Helper scripts to set up a checkout of all
>      the pieces this build might need. It might clone the BitBake
>      repository and the OpenEmbedded-Core repository. It may clone the
> -   Poky repository, as well as additional layers. It will use the data
> +   :term:`OpenEmbedded-Core (OE-Core)` repository, as well as additional layers. It will use the data

We already listed OE-Core as "might clone" in the previous sentence.

Just merge both, into

"""
It might clone the BitBake repository, :term:`OpenEmbedded-Core 
(OE-Core)` repository, as well as additional layers.
"""

Cheers,
Quentin

