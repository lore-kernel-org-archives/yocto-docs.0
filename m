Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660B2D2502E
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:05:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60860.1768316747641785721
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SmO3Mn0h;
 spf=pass (domain: cherry.de, ip: 52.101.84.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bcb87IoY3kQ5lP4DB293qdtvkudOSBjmsGGJvncEUpQKSyU+wlQG3oKPmdA3z3aD3CHjmuyk+LunEYzj1idKocqM/6DOeTZZWrtHnhOOtnnNctR3UrUKRFT/MlSU4iyd00xZCxjk3VMMhKd1XEaEsLoRNLs6CiEczE2AwbqxTZI1Cu9eZyRXgXgcblQlCvDFMM1WUm+clF8neipb3JBqt07mxZfRYDqxy34J0yULQWrcmHxan+zAO346YUFdUnnz8IH46gRmcwpOpOgGiKaLzCvs1p77Q9zErdi6Xhor9kKgfh4XB5Nm7XzI805svL/Y7xD5jCfv1SDD4SNxYL7zig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqsr1BnVqFrOgkRCu4nIfhP3R6Vl8eTuVX2Z2WWLvOc=;
 b=QFHzC8FZyIa28lU4+ZUooueVIaDmdD/KJfuBUt382Bvq7y93OB7EqZGrCD4SjPQPiWex589JzXCmTgoMwuSsLwDMJ2YTfQ32UfP/MLO58E7grckmV/YND+dWAg0dV6KNKmd6fln3q9I5mSRftoxbErXJOLBfIOe1gIoyRbQ2ofDhalCLwbc26pzSjeX+7tBJBNJ8PxwJ2WyAOw8Ec6ByAVzXxjHqJcHozLcNzprxmfc9jiYn74EYsEzGcZ+nB6I28aGAL5nS5+FETlUPPqPgbfGYuS71wC9KluGocLf9MA7og8snRUFtKd4deyQFPLot1J8DtztTFjcxARvwpsGNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqsr1BnVqFrOgkRCu4nIfhP3R6Vl8eTuVX2Z2WWLvOc=;
 b=SmO3Mn0hfZ5PB9rEgOUHVAlEevmMISbBEHq1xBj3S3gGRrlBEVo4ImNHdDQIgctX5XN/cAqmVaZ1ZOsyQAJWFFBpIhdCPfcWIrNqZnuu1+hknJw/uNO/gDPSDcjq9BBgjfGg2+IxNGch5uaZthUrmepOsS1NXT/9QPI4k74+mnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:05:44 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:05:44 +0000
Message-ID: <704895f4-9fa9-4e9c-9674-b41b618573e1@cherry.de>
Date: Tue, 13 Jan 2026 16:05:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 40/53] dev-manual/packages.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-40-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-40-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 511530df-e241-4d24-343c-08de52b53979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WndLUGdMK09JZFArNjVadHJHSUZta2laS0NjdXFZNWtUVVFEYTN4OUcwWEZI?=
 =?utf-8?B?eDR0b1dNRzZpa2tGaFZBUHVBVGUyeTNtY2dRMDBnZ241czBnN29KUjVJZzUz?=
 =?utf-8?B?UVhMSm9XaXpRL2VsOXNBRVYvR1ordDJCV0QwVGFpN2ZyL1dBbjhnWHFrcnEr?=
 =?utf-8?B?SVUyL3k2dVpvdC9Na1BxYTJpMWhZWVBxMHVyYlFTaXpOc2FBL29KN0g3MGlZ?=
 =?utf-8?B?TFZ3L04xb1o3YnlYTDBYeDhncGJNSm5LMGdKcTNMREd5SVpKYmF6R0JkSmpW?=
 =?utf-8?B?MHdRNnRVUC90bFV5OW81SlU2SFIwaDI4Qmw4TnJRcEhibzJpVmdQd0MwbVhX?=
 =?utf-8?B?VVZHV3pRSnVyaXRGell0SkFjVUdVSlljQVVWeE5DQ2dQaUQ5dktwZFAyUE5U?=
 =?utf-8?B?SnhkdjVZSlNHcnlnai9zQnIyMHNZMkxoMDBUTTJCV2FrVTJGeDBqU3ZvL3RI?=
 =?utf-8?B?NDRadGlYOFBmNmxFc2VwRDFZZEpKK2VoaDJYTk1TZFZzV2tNYjl6VEhxYzUy?=
 =?utf-8?B?RmFvYi94T1RCc3RtNWRyY0J0ZVdlYmI2aWNhSWZBWU5IZk1YdWRXQnkvak1x?=
 =?utf-8?B?WlhHd3VsTW5MM0pIbEg2N0ZQK3ZJZ2RXd2VNaUNucmVVd1dEV1lhN3A0NDZ4?=
 =?utf-8?B?VDdWNDNYQ1M2SW5rU2RSMDVtVXpJdEVRNmdTMHpJcEd2dDNjZDRZcHl4cnp2?=
 =?utf-8?B?K2ZVUUQ0bWZoV1BCM2RJZ0RSRjhveWxvS3czODZ0eDdrVklUZEIvUHJFQ3ox?=
 =?utf-8?B?aTByWVRRb3BBaU1QT3dMWjY2NUM1dVg5QXJ6R3NyZExoTkc0cEZsalAvS296?=
 =?utf-8?B?VUorNHBkU3RHS2J2UFhRaERnMEdzMW1oWFc1TXUyeVozVkpHRDNaQXViSkcz?=
 =?utf-8?B?SFloTHQvU083L0l5Q1RucFdsR3AyUzFtSEt6NTdvcUlBY1VzSEh0eDZCeno5?=
 =?utf-8?B?YytHV3h1UHBFamJhdEZHVHdOd0xzWHBtejRIQ2Q2S2Fqeis0RDdIYklXZU1D?=
 =?utf-8?B?eDZsakUwbFJIejRkWVhuQUcrS3hHdnU3T0pCTmRDSDg4Zzc5RTMrbklsaFAy?=
 =?utf-8?B?ZWUyTzFHYUEvb0JZMEloZGl4ZEpXQ0thVVh3QVYwZ29oVEx4VDZpeCtBRTRh?=
 =?utf-8?B?OHNhb2MwZldFSzl3M0NhVFVVQVYrWFQrbnVFakRNaklHdkwwalk3UEgyUzlj?=
 =?utf-8?B?cC9laXpIeGY2TCt2UEh3K0NsOEkxaWN1OWVON2ZVOXdXRnM1Zm5UMERtdzk2?=
 =?utf-8?B?SGhCWG1NaWNNUTNjWXpkZEJNMDNoRW1uZ0ozU3g3ZVNHOENDQmhhR2ZnM3M4?=
 =?utf-8?B?Vi9zdEVxVE1wOWRxakIyT1JQbEsweHJlWVQzQlE1dFRtL0wrSkgwZGhmdWh1?=
 =?utf-8?B?eWY5c0JQckcxOEdEUUJsdHovN2xLREZVai85RmdaMHl3bllBZk1DN29zdkhQ?=
 =?utf-8?B?WDJHOWM3ZC9WQXIvclN2NWJBdmhjaFZQUkphT3pjMExWWGhCL0NOYjlDNm1z?=
 =?utf-8?B?ejM5dk9TY0JkYVV1YmpxdnpSb1k0SmxBbit2OGFPSkxLbkNaNElUWmRjNDNI?=
 =?utf-8?B?NllSYWdrdE9tOGhpVmxyTmZJMjRDcGtpcit1aTZqYS9TZEozOG10TS9tbU9k?=
 =?utf-8?B?R0MxSVFDYmIvR3d2d2dIVGNhVEgrY1dkMlUyZDJkMDBHNnZKSmVGMXUycUEy?=
 =?utf-8?B?OWsvZmo1b25ZV21UY2pWWlBPNGtyZUtZV3JoaDVuSXpETVFJTHV0aG9td2Js?=
 =?utf-8?B?MkZYbFdIV3ZVSUVPL2M3a0p1U1hjT01JK3hiNEFxU3VTc1FtNm9UTGVTbGo4?=
 =?utf-8?B?VWxoc0FPVlF1SlMwc2E0bC95TXlKamRxZFhZK2IzUncwWHNJc1VScjU3VGVT?=
 =?utf-8?B?T05XVENBMVhka25sVDgxaTJSV3VIZU5IOWRDbXNUdmpXTkcvcGUyd0ZNaGow?=
 =?utf-8?Q?A1s0sth5BOKBgxSemXQ+YMR+b7YiRNI3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0pBdTZrMGpWZCtNZDZEcVUySTgxUzRCWGYxOHdNekZGM1dsZ0MzVVhJZHRK?=
 =?utf-8?B?aXV1bHJSTFdhN0RCekpuNnpPT1l0bTBXeHdmN2U4OEl0SHBJWnVGQTl1SlYw?=
 =?utf-8?B?M0RhRW1SSXB3ZjFoM01yd1Y5dS96ZC9vU1R0R1Bnekl0bnRycmRKVkpTdnpv?=
 =?utf-8?B?NUFBVDRYSm5NZkxRZXBJNUhVemh6MDIxM0VVK0xCV0U3dXcrbDMrelZmNTV3?=
 =?utf-8?B?SmYrU3FGRUgwdGRZY0tXMEhpbHE3SmNONDhCdWtydjV0c1FqS1lFOVRKMUxF?=
 =?utf-8?B?MlIySDlvdURPa3pVQVptOW1xck9YNFZKcnJLTy91ZVhMaGpSTDd2dVdIOWdN?=
 =?utf-8?B?M0VOYXNXZmVuc1Fydk5GcmNXMEIrV3NwdHhrdnFuSUNzcjRtYzZnOHRzTlJy?=
 =?utf-8?B?SVQzVU9lNmJhQ1VqdUY5dzRRb1RmRjBwMmVaREYvN3poVlkzc0NWQ3FuREM0?=
 =?utf-8?B?d0JndzhIaFhnRERtbjU0SDZMeGZWTmZwL0ZFWWdRVHhJU1VVQzIzYTJtMVdx?=
 =?utf-8?B?SjFMWVhnS3RCYkVlcHk1eHUrT3Z5L1ZKMURFL3lUMmppS0dOWFlEZTB0RlEr?=
 =?utf-8?B?NnFVTFNOdmJaUTQ5Q3VTVFRKQndpQkFrNDBRRm1PWWRHVS9HZ2dTcXJtWmJV?=
 =?utf-8?B?aHBrbnFCZENtZDVoTGtPZk5ueTI2UGQ5MzMxOWVIVGpzcGZGV3dmZjcvb2ow?=
 =?utf-8?B?WWFKS2w1ditiWS85YlJVdzBNcytoR05iWk43WmZVKzQySGYxd2xsTVFOa3Zh?=
 =?utf-8?B?dGtnWi9XU1BiM2VnQkpoV2xmbVY1VmV0Nzh4RXYyZGxRUFFSNWxOZEo1Rm9x?=
 =?utf-8?B?R29VQkZKck9xaTRxelNzVHBXOXY2YWQ3SEhYYVI4TmpORlE3TmVudkZ1Y05o?=
 =?utf-8?B?eFE3bld4L2VWMkowc3NpZlVNWURXaEZreTBGM3lhVXZ0MW1TeVJZVnU3eWxi?=
 =?utf-8?B?Z0RhdTd4enVVTzZhMXpvUXF3Unl3RmFoWG54NWcvU0kvT0h0UjFVSk5xcUMx?=
 =?utf-8?B?aHBHd0gyQ1hwOVJ6TVQ4T0J3cUpkRkNOMEZXL09obkZaUHg1T1ZLbWg5QWF4?=
 =?utf-8?B?SHJhSHJUZndkaDgwQXptS1lWUkNGNUN6b3dwS1JYUC8wc2JSQmQ3ZVZHMDdt?=
 =?utf-8?B?cUNjb21jcjV2MUhldzdDUnZRU0cwblRrTzJvc2x4ekgvYUpuNjBOaHJNRThS?=
 =?utf-8?B?NVZqUk5oYW15ZUs1UlQwMXVjZmEwU2poTDB5eHNYdXUrSi9NWG5TMjd6NlMx?=
 =?utf-8?B?YUVoMHJUSm5PWWJLNmFEYVhhRVc4b3hPVUFmQVZUTW5KQlFKY0pzQXhvT1Vq?=
 =?utf-8?B?Q2hEU0RLTmVmYUR3MDlJMUVzd09UdGFOK2NDbkxPZld1VWZ2YldKQkJpNVlU?=
 =?utf-8?B?RXM2NHpnc0NML2RNcER0ZC9EREMzaFkxMngwcTdxUGhoakVKSmxoOFdLbEhz?=
 =?utf-8?B?NTJobUhKZ2YyRFB2ZnFIeG9HMnc0NzR5T25OVmZBYTdVQlNoWG9IcFZFaHVx?=
 =?utf-8?B?cXVtWGIwRUEzWSsxVitsdFVuVzQwb2Q0cXQweW95Qmd3cVRWK01wNFd3TTh0?=
 =?utf-8?B?TlR1NFR1Z1Q4S29GOUhKZ3A1SHR2ZytnK3lTWThTcE02enUyaC9IZ0EyS3hP?=
 =?utf-8?B?OUdqS2JINVZ6ekEza0hNQjZ6cXMrUWpsaHpCT0x2OGFlQmoxQkRGeFdKN1ZP?=
 =?utf-8?B?eUE5WnQzbzZaMEZMZUgrTFdqY2Q1U0Zqelptc1B5KzdmQ0xlY2Roa0ZvSXU1?=
 =?utf-8?B?RkMzRFNLckFEL0JjdDREQXFVTG5KTlhlSU5jMjFpV3NQNEk3VmdodTRPSGow?=
 =?utf-8?B?eEpJS3Q2MVkwS0E3b2k1ZU82MlA2VDEwTnl5ZUZKNE9GaWdnMVNnV0xIUk1G?=
 =?utf-8?B?YjJLWm84R29jWTJvaTdQbThJMmkrV1Q5T3A5SFJrV3NEZ05zTlNaRHA5MmpO?=
 =?utf-8?B?T2Vyei9RbDFLU2ttUkdDS3VCQmxvMHJPaWxCbnd1b2FTL2w1K0Jwekc5MTdD?=
 =?utf-8?B?MGxob1hhb2taYWJNSk5VTTNhMjllakRWUE1XZVBZZmlKWVQ2aXRNWEVUM05j?=
 =?utf-8?B?SXEyOW9GVEFVSkZQRFVINFpSRmhHVXV1clRNTlcxdnJwVlRtZXpLTVUyVTBX?=
 =?utf-8?B?dDlBVDdTcmVuYmV3K3VqUDVUQVNMSGZ2UWc2eXVxZC82b1E2SzI1ZVBwMFFB?=
 =?utf-8?B?eGZEbnIrTmZDajJTRWgrUU80aGNTcHp0bXlxTW5INXRseVlqNjJjTmZlQXJk?=
 =?utf-8?B?djNOMXRGZExBOXl1WFgvM2FsdW14N2N0TkRDWlJiZk96YnY4UEtBNUZxbTZZ?=
 =?utf-8?B?RElDMlFwMytocWg5Y3BDQU9FdHhQM0w4L2FIVm43YVVxS2dSUS9sZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 511530df-e241-4d24-343c-08de52b53979
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:05:44.0856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5jlatVxMbIUNtHiil9SzUskqGlD98K8hANueom1cyXcjPag5qKoqWdH1R8W7LR9Vma/IJF0SZMzIOJph0Du9zIlZrNi+j09mtJ0vrvEMhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8196
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:05:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8529

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/packages.rst | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
> index 8bd48c8e8..a27c076c3 100644
> --- a/documentation/dev-manual/packages.rst
> +++ b/documentation/dev-manual/packages.rst
> @@ -362,7 +362,7 @@ multiple times if you have more than one set of modules to package.
>   
>   For more examples that show how to use ``do_split_packages``, see the
>   ``connman.inc`` file in the ``meta/recipes-connectivity/connman/``

Maybe provide a link to connman.inc?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

