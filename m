Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22414D0C859
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 11:26:22 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56645.1768303574984003973
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 03:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ju6hrZqd;
 spf=pass (domain: cherry.de, ip: 40.107.130.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAA4fTnkVokDVHq8f7r+bqkmsd6ZhzRdPSrmQbSAxl6cIkzKQGIpcUXmbHiUWuqzK+zTjeEvy2pXY+T/gZpul95x9Af7bvFE0Af0sHUlSdbuJDOAJotHUvrQEtK0e5g+tUnkd4n2iMF+qwRj9lIEb3AcNkOQEmrwBY3FvQ9aSsAr43EJB/ACCgfc14ig0OD+0gZXKTbdfba4p0TtQ8IeCi7hnQ/SCCLXjIT3NZoFx17s5Is+YvtV18+oV74EzkD06dwn8VX7EAMroVsXXUBl36t/X7Bo+tpn/5yokTBe5ELu+F9J+ZC3a2OU7XNTZnqB/P5l1Wq1lgR0yPxsdUYDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iHG//1m9r9Bp2gzOXdGQrzHZSrXxW3J56qo9Cht/Zc=;
 b=m/IU33+OysHZKR9qoWVFiI1xYAvGUCIqSKlkK1ybnVE5gcMqgMgPGrX4uII+z6ZvheI7Vv7tspdabxEfJ4z8ARt3nxcby5wGt886qjy8paVVzRIrgSHzd737FMuSqjmEkZCtc8u/WAQLk5d44cPxa6pc5p7LdhEKeliCZeIgrzyHENoCIQiiQkVbSVJbXMdsQNqOAySPUDmrjCo0Y0PHMugGsINfVdqPesXi0bzf3d0WUcc02tADX+eCSVX/hm0f3LWXjGrxxQ9A+tAwolse7Lhdprb4h/f57ox4CyTLaheN85yxvAow/nuzjNVvI30+jiArq2QHc+bOAaVK+iqgIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iHG//1m9r9Bp2gzOXdGQrzHZSrXxW3J56qo9Cht/Zc=;
 b=Ju6hrZqdo+/Ydrm40DRhp/mTvosSvKEdKLDqZwBPICihIsjDbC3HPgaNmQ8yHbC5cCoLvoOgphsXGIclv665oDhL02pstXh2jcCRP0G0m7G1tCcEpQzIGFZ/6wXktA74WHw5itqMAm1V2l4pr/yFgup4rW2s03Uqa8Tj2jRU3Y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB11502.eurprd04.prod.outlook.com (2603:10a6:800:2c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:26:08 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:26:08 +0000
Message-ID: <383d1da9-b7d2-4d24-8f39-2394e1410782@cherry.de>
Date: Tue, 13 Jan 2026 12:25:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 06/53] contributor-guide/submit-changes.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-6-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-6-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB11502:EE_
X-MS-Office365-Filtering-Correlation-Id: 293f8e3b-d8c2-417d-5f2c-08de52968c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VFoyMkkyVVhVdGUyVmVGZHliZ1hxakNmaEl6Z3VXa2xMMlJVSS95a0RjNWVX?=
 =?utf-8?B?U0h1a0pMSk84Vi85L0p6ZEYwSkw1bEJpWHVkQjNSZms0bllHbGFYZW1JRFVt?=
 =?utf-8?B?c1RhTklScmlLcDJDUXJjV0RRSW55SzlSZ3orT0tuWGord25ldGVpWmVKTklE?=
 =?utf-8?B?aXE2SVVtU2pCTVB3REJtZ2lpbjR0VW8wVFpCNytWeUFEOFBlK2xueGp0ekVO?=
 =?utf-8?B?VWNGNzNiN0xvNVdtM21iYUVLemdEN2Z2Z1JWeXd2NWg0VjRrTkc0cjJtL0dB?=
 =?utf-8?B?aGJYcUtCRUxMVDM2UHF4QWtYQS9kNmlqNXliMUJxck5QcG9ialE3N29vQkov?=
 =?utf-8?B?QmdOL0tnQ3YrcVd0ak9ROU9wMm9WdVhBSEdoWm9Bd0hBRjZSQk1Nc3paaEx4?=
 =?utf-8?B?Y3RoNFFjcmwzSVE4aFFpR1B4dFErZkYxT2Zub1crZEtmbkdXRDM3bWtHVldQ?=
 =?utf-8?B?S2JxMTlSbk9HdlEvVmlFQzFhRnhFUWhXOVlZd05zMElqNkRjWHY2bk1nMVJn?=
 =?utf-8?B?OWo5STYreXAzeTlvL0NLekYxVm5xM3RSOUEzOVU0eHJENkRTbGY5d0J6Mk1p?=
 =?utf-8?B?d3J3NVRjRVYxMDZUdCt6bmJpWjZOQUJFS0V5STVwVndIdXEwT3BXLzNDVUJH?=
 =?utf-8?B?U2lVc0RjZ1ZQWm9jNjRZMWFiS3hBUWZtWHhhMHpKSDA4NHp5WE1PWDdiVklT?=
 =?utf-8?B?V3NmVVRveFgwYzcxN2NOZzdScmtBMzV2OXBhdnNqRk5sa0REMVlZMUR5amtJ?=
 =?utf-8?B?Q2Mvb1FPUDVPUEtITm9obDZyTjZ4WjA4cnhaRDBWZ1VIbGFRZW1IbUNGZTBH?=
 =?utf-8?B?TFNTaThBK3VNa1laL3pJd1Y4cEZFR3liTm1jSGZEZW4vaFpSZE9BUlI2NmtF?=
 =?utf-8?B?ckFwNjAxL2JDMVl3Z1JXWVlYeFdrazBNTlV4U0VraDNWcjJBQ1BHa3hHR0Rr?=
 =?utf-8?B?MitoVVZXZzc0VC9YV3RRREd2eC96VCs0MUxGcVNzaDNmelVzOEpMM3JqaU5X?=
 =?utf-8?B?dEpQQ2cyNlhJL3JpU292Z1ZXbzRvelpUY1Y1QWo1cnlHTlpXR2tiK1A5VzNY?=
 =?utf-8?B?Y2VtbDhRc3R3ZkRLRTMybXJtLzRyUzFXSENKdEE3Z2REWG1uWlZNUGtZR0p5?=
 =?utf-8?B?bzEwQ0srcTliZHNrZDdSN3dQYUZSY1NHWGlObHdpR3NlNGJsOHdSZ2xFTnQz?=
 =?utf-8?B?b2JaZEVEbm9WV2RoMkxJdU1nMjBSOEhTRW9EaktEWXgrSlFoNHRRMTJJUkph?=
 =?utf-8?B?OHR3TWxPczA5UncwS0RBVENBeW9MQy9NWHQxYkYxaVFPZlVWYTFWUWszSy8x?=
 =?utf-8?B?TU1vN3F0bmVoUVJacjc0QWtHSFRTTFcxZGdNSVF1VlNnOGNYbXpmUTZqM0xZ?=
 =?utf-8?B?WURxbHc4RTRudlRJbGJpU05Fd0xSU0RxUG5rK1RqM0h0OWNXZDllck5IdnM0?=
 =?utf-8?B?aVFDK2RpalVnck9YQUV5RTltZngyWnZrT2doNWxvdHg3VS9ZOFpXYnNWbFdE?=
 =?utf-8?B?d0pRcGxYYTFNMXY3RUR4U2RUVS93UVRydkY5Qjk5MDM5VHJiNnNYOHgxQ0lm?=
 =?utf-8?B?YkNPOEJaL2YwNHREdXJNNU12SndlNUVFaXZ0WXN6cHpraFovM3dpdUhMakts?=
 =?utf-8?B?aStOMXlZWTdFeGE0cVphT0V2VWtRbUs4WTg5RWtCU1FNSEF0RVptZ2dXdUFy?=
 =?utf-8?B?UTJRN0E5ekNOdjdDSlJaSm80WU1HZUwxVzlyQkRwdWdCL0UrczhBdjh4YXYw?=
 =?utf-8?B?YitWNGtXc0pOVUxQRzhDbVd4V1VER0VETXJlMGF4U1ZsTVlNaFR3YnVVOTBL?=
 =?utf-8?B?MnlHNlF6K2hWc29Lb1laV01WUjBRNERmNE1LRkk5TktCMlFCUDFyRGoxS2Jo?=
 =?utf-8?B?K1dycm5SVnBxMFVXT0FrNXNiblZyVkc4Y3V5R2xxak1hcWN2dVRIaVVHVnZv?=
 =?utf-8?Q?fDGBdQpapQGUXwdUHngOzzM+HooSWQzU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGVsQjBUeExCTjVTaWExaGEzazFpN1ZWc05pdll3VkFqSi9rR2F6dVV3ekFC?=
 =?utf-8?B?dUlXUDJ5aG16UVR4L0hOWStXeFV3RlU2amVCK055ZHFtS3VpandzamNYOWc1?=
 =?utf-8?B?Wm45dStsOHB6ZU51UG1EYzlvVjZyQk1oakVuSVNUa0c4QUpseS9QQkoxZU9J?=
 =?utf-8?B?YnlWamNwUFhML2RUTFVwdjZGZkUzSDNiZ0tWcVRxSXNNb3VxMmtCYTN1SWtt?=
 =?utf-8?B?VWFiZzVrSEE2WVUxKzBTTkUvMDAxUXNscy9ZaXViZjNWUFJESWZDaGVDZ2Ry?=
 =?utf-8?B?T0ltS2w4aVBSM2ZuRmpKUm16ZGFxeUZjUU54NlFyd3BTSHo5YWRQdlQxbUE0?=
 =?utf-8?B?ZC9YYUk4cmEwdXo3V2dINS9tQkRuVm12ckg3MkVWb3VScTFnMDhUUnp1MW5m?=
 =?utf-8?B?LzU2SEMrcHpHYXQwQUl2aGE2QXZPVWg2aHExNGs1ZnVJYnI4UndHZkxqOGJC?=
 =?utf-8?B?dVUzK1FuRkFNRTd4L2lrL3pvQUlQa0F2aUNNQ1BIK3BHNmZ5c2tqQ09qTTVz?=
 =?utf-8?B?eEdJSUhFWjdOTElFWEhUU05wRWxEZmFpbVV1YjBYOHdlb0lsV3B2NWlhUjBy?=
 =?utf-8?B?Y1BXdllHM2xCU002SUxyalZXblZ0M2ExaEZNL3RnMTZwRnIwS0hZb0hGa0Fi?=
 =?utf-8?B?VEY5MzVwZU82VWpmTjFCd2wvUGk2STQwYkwxQTNUcHk2cHorZHIrbUdqcnVY?=
 =?utf-8?B?Q1RhbHZrMTZaZm9Oc2lNb25qdXk5dktVdUZubEd5M2RGUzBhSFB3Q0V4aEQ4?=
 =?utf-8?B?ZUpSOG9obFdBaXVRcHJpb2NHemxiQ3lLWHFwVXlpS1pRYUZGQXVpK2tpZTF0?=
 =?utf-8?B?QWc0YmltQVhySldrVm4xREhFcUJtUWZOd2VmQlRzTTA2RlFVeUhmelZiL2NP?=
 =?utf-8?B?R3BtY0Jkb1U2OGNkdkNkV25WNXhzbDF1cldOSnZ5TkJ6Zllqd2ZLMklMaXg2?=
 =?utf-8?B?WWVQTCtzZHozeTEyV3YzYlNTLzM1QVUvVE5UcjNlbXRRNjloL0ZyVUIvc0FD?=
 =?utf-8?B?ZTErUk9xTk01U2JLaUc2NURCeFJILzVWcGpWbHRtSGo3TEEyTGo0elhkbERO?=
 =?utf-8?B?T20reEFiNW9ldk5BaFFTTVh6N2RmNkYyaDc4eG44U0VvSkNwSEhqVnh5Uzdz?=
 =?utf-8?B?eDh6QzVkcnU1dmwxZGg3VGZOcWhCMSs3Y1lKSVNya2ZyV2xmNVlSR2FzKzNU?=
 =?utf-8?B?dWlRTGJyS1dwSFdqREtVNU1OemthRnZ6YXpnSUkzRjNQRFBWbGk3eE9WOHI3?=
 =?utf-8?B?RGYyU2FCVWo3Q3dLQmFEUUxGKzFCRXZocVdMNjRDU3lLMDRjL2NEdExmRFFG?=
 =?utf-8?B?b01oWno0MGo4MEorejZWZ3UwWjVINFFZTWNLVGNqSWY1enVVbnNEbnROL25y?=
 =?utf-8?B?dHJGanFFSXVYS29TM0VZSmVieVNCSTh0QW1RdmpwU1BleFBwa1d1TTAvcmR5?=
 =?utf-8?B?a2wzYWNITGZwYUwwbEZ5TTZHbm5JTERhSjF2cEM5R2czWjMrVnhhM2lXaHps?=
 =?utf-8?B?MmVJMWRvVFZFajNEQXhhMTZPTWRnTldxbElvVmtaMFdCV2dVN2xFQ3RNMEo4?=
 =?utf-8?B?UlNqemJ3ekZRNDZQUzREanl4TElYbzlHQlFkODIrWEh2M0hRZkcrTjRlTGE0?=
 =?utf-8?B?YlRZRzRWMjh6dUdaMU1BSHY5WjYyN29pQTVTTDlPallwa2crN0xWQmpqQ2JS?=
 =?utf-8?B?WnNkM1c2NnJaK1JVY3JkV2d4azhNcUpwTzdHd0l1UUsyV0pxNmY4eUhDQTZS?=
 =?utf-8?B?Tms5eXRPdDA4WkEyc0tpQVdIdVNBOXVQbWxBZXpQclBNSjJUVFYzc1Y1ejQ5?=
 =?utf-8?B?U21UTHdjdmczVmF4aFpCcGg4dnhzL2pLQjg4SkdXdDl0UzJScTZHSU5VOE9T?=
 =?utf-8?B?bHFoakkvTWZ3N2VvV0tlOXFjdmpTUjBKMnZJODNnMDRmeE42dWY0ZWM2VEt4?=
 =?utf-8?B?aisvRUN1QVNGdCthMHRmT0RqMjRlVEpCbjdYZjlVU0MrTTgrQWtiWG9ZR2dn?=
 =?utf-8?B?TDE5d0tWejlqL3YxaHFYbWZieUhKUmhPWjhjMHdEM3ZBWGdxQ1FVYlB6TjRO?=
 =?utf-8?B?UUlicWlYaHdjNGxkMnpKNlZ5ODlaTTdGQ1h6ZndOVVNNV2cwN3ZmWDM3YWFw?=
 =?utf-8?B?L0hzRmEyNE41WnlqUDAvSzFTRjJ5Y0hWRDRkMjRJNTRGajNwZVdMYXdPRTUv?=
 =?utf-8?B?cndBLzYzK213VnB1eVJOSFZUK1J5Q1lmMU5KMlc4QTMxbDlRenhPYlBVTHFL?=
 =?utf-8?B?TEs2Uko0aWMwVVowWVprV3E4ek5nRmRhTWVnNFJRLzVPZnViR2VMUE1ObGJ3?=
 =?utf-8?B?SGRLNklWTU9LWG9FMXJmSVUxaHpoUmtPQjNacEpHbk1RWUxPYVYwUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 293f8e3b-d8c2-417d-5f2c-08de52968c4f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:26:08.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpIoHRQLlcwpAvtosnzaf2E0tPI/FeQ2rOV3V4G8a2j/+KEACb+JjVikojWKOqXdOGh73Mb3ANpU8KQCo18Izrpl7zWGnCPOUfyYJ3rtBuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11502
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 11:26:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8487

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core
> in most cases.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/contributor-guide/submit-changes.rst | 29 +++++++++-------------
>   1 file changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 6306ed45b..d282cdf75 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -429,11 +429,7 @@ and then based on successful testing, merges them.
>   In general, each component (e.g. layer) should have a ``README`` file
>   that indicates where to send the changes and which process to follow.
>   
> -The "poky" repository, which is the Yocto Project's reference build
> -environment, is a hybrid repository that contains several individual
> -pieces (e.g. BitBake, Metadata, documentation, and so forth) built using
> -the combo-layer tool. The upstream location used for submitting changes
> -varies by component:
> +The upstream location used for submitting changes varies by component:
>   

Everything below needs to be reworded as well as it was written with the 
poky combo layer in mind. Now it should be much simpler as what's within 
a repo can be contributed following the README from the repo?

I would also add a note for the stable releases maybe? Since those 
aren't covered by these new rules and you need to know about those 
limitations (so maybe a link to that section in the older releases would 
be enough).

>   -  *Core Metadata:* Send your patches to the
>      :oe_lists:`openembedded-core </g/openembedded-core>`
> @@ -620,7 +616,7 @@ have been followed:
>      methods to find out:
>   
>      -  *Maintenance File:* Examine the ``maintainers.inc`` file, which is
> -      located in the :term:`Source Directory` at
> +      located in :term:`OpenEmbedded-Core (OE-Core)` at
>         ``meta/conf/distro/include``, to see who is responsible for code.
>   
>      -  *Search by File:* Using :ref:`overview-manual/development-environment:git`, you can
> @@ -645,9 +641,8 @@ have been followed:
>      The Yocto Project provides two scripts that conveniently let you
>      generate and send pull requests to the Yocto Project. These scripts
>      are ``create-pull-request`` and ``send-pull-request``. You can find
> -   these scripts in the ``scripts`` directory within the
> -   :term:`Source Directory` (e.g.
> -   ``poky/scripts``).
> +   these scripts in the ``scripts`` directory within
> +   :term:`OpenEmbedded-Core (OE-Core)`.
>   
>      Using these scripts correctly formats the requests without
>      introducing any whitespace or HTML formatting. The maintainer that
> @@ -660,7 +655,7 @@ have been followed:
>      directory into which you pushed the change, and provides a subject
>      line in the created patch files::
>   
> -      $ poky/scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
> +      $ ./scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
>   
>      Running this script forms ``*.patch`` files in a folder named
>      ``pull-``\ `PID` in the current directory. One of the patch files is a
> @@ -673,7 +668,7 @@ have been followed:
>      and email address. In this example, the email address is a mailing
>      list::
>   
> -      $ poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
> +      $ ./scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
>   
>      You need to follow the prompts as the script is interactive.
>   
> @@ -682,8 +677,8 @@ have been followed:
>         For help on using these scripts, simply provide the ``-h``
>         argument as follows::
>   
> -              $ poky/scripts/create-pull-request -h
> -              $ poky/scripts/send-pull-request -h
> +              $ ./scripts/create-pull-request -h
> +              $ ./scripts/send-pull-request -h
>   
>   Submitting Changes to Stable Release Branches
>   =============================================
> @@ -857,14 +852,14 @@ used testing branches for OpenEmbedded-Core are as follows:
>      :oe_git:`openembedded-core </openembedded-core/>` repository and contains
>      proposed changes to the core metadata.
>   
> --  *poky "master-next" branch:* This branch is part of the
> -   :yocto_git:`poky </poky/>` repository and combines proposed
> -   changes to BitBake, the core metadata and the poky distro.
> +-  *meta-yocto "master-next" branch:* This branch is part of the
> +   :yocto_git:`meta-yocto </meta-yocto/>` repository and combines proposed

s/combines/contains/

> +   changes to meta-yocto.
>   

We also have master-next for BitBake which was handled by the poky combo 
layer before, so we should mention it as well.

Wondering if we want to add yocto-docs there as well maybe? Not sure 
it's as important as the other three though.

Cheers,
Quentin

