Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB33DEB4901
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 10:57:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42624.1770893861777960039
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 02:57:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DUkiAG2a;
 spf=pass (domain: cherry.de, ip: 52.101.65.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VECFPI6DOb3Giv0EvSNrrzsLwzwA1jV2zOHTYPVOJDS+f15AGwTI2pW18oqS0YgWeObOF2ltbynlH8FA26tIj3cFxJGz2tinGsj3zWQjyBdwpmkYyYO17vA7JeZVOu9IZrbo7GjSu9SP/dwoArPVomi3oQV/XD7kBCVkrxBmSXlnTCPEQ6t5lKz6t8nohnBj3L7TiG14JtiqeeCHg1qWVzypjY6BTQtp0ggW0+DQQW7f+VSxfxmYGefAAK/EFBHqhy0VO6SGZJ60Vu+q8zVqQJSojhEsmw6KbCZ9WNHltCothkcEVQjVJTkNJ0L0M502+4savvz7wxH1zjzGOdu3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOmcVexGuiH/i/LvMEbDpMhuJuU7AWaulR28UXXQOy0=;
 b=J4bVFVpqbwoVgHe+x3EnpbVTSeO+xP5YMNDzH3uJW7HtulKeXDqnvL8iT9voN6n13WTk+7j7JNOPipZEc9LKqoFIYetXONynY2zZ3K2NlVjstMsvNQ0U2fiMsViGOlR6xTaTB/oADtEpsp870a9vJFgI4g2GPSBzl9r0Cpr7mQW2SrIYCk1YPmfHP960fOmV2E7b/h61Ss36rc3thDARh6eIxNJBRFeRVrd3rRrSvas1c2jTL2TZcC8rCCruh9QpMyezDn37sZmE1WM+mJc8DUaFU0Nro6ccl4/ji5f7KBN2E5eVchMzt+O5SEv9OBikIgHtoH8FHDSEQCFbD+ZGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOmcVexGuiH/i/LvMEbDpMhuJuU7AWaulR28UXXQOy0=;
 b=DUkiAG2aejtuB/ukO+xC+pS+J7F0m+HaRbD7S/o2Zyms3zj4cvjnVwJ3aiMOkjHpqymQCTJJ+fcQoW982kgUJvksbSTf11d7ip5aWEYECbSe5eY473lqWvzSahcYFtlF0ODBYIVdPOg3i8x4ARB7phyhWd9EMtcMMQK5yj9nOes=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV4PR04MB11307.eurprd04.prod.outlook.com (2603:10a6:150:297::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 10:57:36 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 10:57:36 +0000
Message-ID: <d371ba4b-40b7-4017-aa74-243a1db2f539@cherry.de>
Date: Thu, 12 Feb 2026 11:57:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] convert SVGs to PDF and PNG using
 sphinxcontrib.rsvgconverter plugin
To: Antonin Godard <antonin.godard@bootlin.com>, foss@0leil.net,
 docs@lists.yoctoproject.org
References: <20260211-fix-make-multi-target-v3-1-1168a6f1525f@cherry.de>
 <DGCUROORFMR0.ZZUIPYYRXZXE@bootlin.com>
 <5288e4be-8e16-4447-b1fd-94d21aa91c4f@cherry.de>
 <DGCW11KABQIL.QJTTJ8CE3QZO@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DGCW11KABQIL.QJTTJ8CE3QZO@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV4PR04MB11307:EE_
X-MS-Office365-Filtering-Correlation-Id: 253b4acd-920a-4a2d-4ceb-08de6a2587f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFJNanNJbDRvMW80SU1GSFFrbFY1dXdWVkE3akVJT2xDZC92Z1E4SXJTUi9K?=
 =?utf-8?B?MWlsVnYyakIxa1k0cXl4QUc4MnU5VUNqNmFRVURJVFFjZDQ4QjJxcTJhcHpS?=
 =?utf-8?B?TjNnVDFtVERPTnYrYTV6Nm1qa3NTb1ZwYysyQkpoc1dmb00yWTBlRS85ek1U?=
 =?utf-8?B?T3JTK01LS0kvZEF4dGM4RzBZOGpURXZQV05UTW5FRTF3TXROamNnajZuRTlq?=
 =?utf-8?B?ZmpENkluUldyRnRWUFg0cjBIVlFCaFh4NGw1dVRKYnF3YUY2bjRoZ3IwOG84?=
 =?utf-8?B?bkEwRi9yK0JrK3FjdEdnN3Z5VDJLcWxhYjBXamsrWWtOTnlPR1c2UEpNalFo?=
 =?utf-8?B?MUlXZ1RBTE9STldHOEU4SFluNENBUTFwQWNWclAzN05rOW5Oa3ZGaHlNNDVT?=
 =?utf-8?B?bm0zd2ZLNUMrdmM2MFZTZS9UQjhLakxSNDE3N21DOXFvVDVqNm1Sellsd2ll?=
 =?utf-8?B?NnhIWU94cU5wSjdYTG9oUjN1RExjenNTNExjajF2djFsSnRMZzJxRmFkQk93?=
 =?utf-8?B?MjJnUkFhSDhHSDNTVnplaGR4V21WU3l0S1hOdVZFVTdxQTNLUGQvTzgxN0lP?=
 =?utf-8?B?Zmk5RGdYMWpCNGV2Z3phN3hUZGVMNlRGQzRUMmZRRTFkdk5PcENMRmNkakFT?=
 =?utf-8?B?aWNjN3grcHV3VTBaU2hBVkRQTHgvQXUycHRibmJnd3FCVjZWZWhIVU54Wm9C?=
 =?utf-8?B?TEJnUEZLUk5MSWN3T1d5YjJZRUpJMXo0WkRYZDM0QWYxem1HeU84M25IdmZD?=
 =?utf-8?B?cDZCS1Z2ZURIZ3lLY1RuTGFlbmdvWDBybC8wZGd0S01LUHo5V1RwUm51VnZo?=
 =?utf-8?B?TCtVaS81eXlPS09VWTE5YlZYSjJqYkJGd2ZIMURsVnNmOGFXV21YR0dwcDM3?=
 =?utf-8?B?d0lDVmlJMk41TVhubXprT3prNUhsamN0dWRwek1pN05Hd3gxWlNiT1F0UTht?=
 =?utf-8?B?RjRjSTlkWFdqaFJaRSt2ekN1VTR4SmZCcGJNQ2gybHg1czZKNkJZSXZmSkF6?=
 =?utf-8?B?dDFTTzQrV1lCWWVXUE1kclUrNnJHU3RKek1yWmU5SGJZRkZFL29Jd01yMVEx?=
 =?utf-8?B?OUZ0VzlZdG92OXkrTTVvMWpML2FQc1hQVHhGNEdxSW9KYXZjRHdxb1pHVVps?=
 =?utf-8?B?UTJCd01KZXpyblpPdUI5anN0Tlc4alVmTHhqc3NlQ3pjL0dTeE1jbkRJOGZ6?=
 =?utf-8?B?WXhIdUFXUmpFTG5iRHAxK3VxK0MxMVQwVlZPNXBKVGlvS25idDlLVHlpNzg0?=
 =?utf-8?B?cUYxK3JsRit6QkwzNHZUcEs1Y0sxbDduTFRmNmZwQ2Z2ang1aEhJMWdQZGR1?=
 =?utf-8?B?b3lEWXBoQVc4bG00TVB5YUVWcXptNVNCRE9DYjVTRTNoTk1QQnQ1WXNBNmsw?=
 =?utf-8?B?eXBQR1QvZjM5Z1AvTnQ5c2dOQ1A1SEhKSm9IYkFDV3VoSFFEYmJCRkRGNGRQ?=
 =?utf-8?B?S1ptQ0xYMkZHRmNpNjdDa0FacmVOSTRnNng2MW41YWJhaW1URjlGdHlFd2N1?=
 =?utf-8?B?T3cyMlRPekNMajJ3SFlMd1NIQXRHT0N2cWRzU2dPZ2kwM3FSOUhvMUlIU2dO?=
 =?utf-8?B?TFBiNWd4VjhRLzJFQ2lRUlp1RnZtK3d1VzdUOWhHTnZGTm4rWFJKUkxmTTN4?=
 =?utf-8?B?VEVyY20zNGo5d3crYThRWFE5NDcxOWJ3QXM1VmRvZ2FKdzB1TmRXL2JxbDlC?=
 =?utf-8?B?TW9ubXRRTlVTd0ZHZGZQWkJpZG9MWkZRTnMyVHFRRjF3a004dHA5NnVjOHFL?=
 =?utf-8?B?cngwd1FiOHFDT0srYzdZMGRsUzhYUUczUlM2RGk4WkI1eUhYN0Vhc3l5U1lS?=
 =?utf-8?B?bEJ2SnJ6NlQ0b0pZTjVLeUZrNGVFKzgvQXV6bXAwWmsvRTVuYWd6a1ZhUzN4?=
 =?utf-8?B?SFRGYWRFc1JmQ05DaVI3bkxhRlJaeERaSytyaDJKYUNkd0VuVUlLdDIrRjhU?=
 =?utf-8?B?UmUzbEdianRReUtZTGkvL1M2U2o0Y0F3dDVUcFQrWTQrbHhaZG1PSFF6Z2FH?=
 =?utf-8?B?M1JmRkF2NjBIaVZVK2p3WkVtVzdTeHc2SXFrZkI0VGpWQmdxaG5kNDZGbmkv?=
 =?utf-8?B?Q0FqV2J0SSs5Ly9Rb3pYOGFrZGlMWVdGTlM4RnNmMUd6NjVHZUNxd2c5Q1dW?=
 =?utf-8?Q?/D9Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VlNQV205MXQyYUJya2JXN25WQ2FhRnRBejhYUWw1Y3ZIdVY0Qzd2M0EzZVZp?=
 =?utf-8?B?dFdGcStETG9tYnRUR0dvOEVGd3FhM1RIcTNCWmFkaG44VFA3TGtSS1IzeUNH?=
 =?utf-8?B?ZWVsTDZZd1R3bThJdlowNzhiUkQyNjdyQlkzbVBlRDJoenMzeTdxL1Vzejgx?=
 =?utf-8?B?UGVhTXA1eEJPRi9CdWZRNkVRdXI5OU1sNGoyRkp5SUg1dTVVa0JUK2VrdEho?=
 =?utf-8?B?K0VmNS94Ni9mZXg2OG45RG5QUlNMVm05M1hLUTRDdFE2dS9kTUUwQkVNd1oz?=
 =?utf-8?B?N04rSE5DZ1ZXNHZHNXlpRjYrRGdUMDMxUUQrbkdBYUdQY0ZTOEtFR1gwRzVs?=
 =?utf-8?B?MFZTcVdSbm44ZzZTOEcyQTF6QWVrNUJuSncydW1KNHFFWmZPckZyc3h0SWhV?=
 =?utf-8?B?Wnl0M2dBUHBFdkpLaVNjQm9qcnJNek1PZkxIZTBmR0kwdldma3NKakl6c1pq?=
 =?utf-8?B?TVljWnFMbUpmNlFQWk45V25jWHpjdUhxVG1nYmhKYllBYTI0ZlhUTFZtS2lH?=
 =?utf-8?B?WmdSWU01ZWZkOThvdjR4UXI3bnFiT2NlTTFoZnRDWTkwZjBBeDdWMEg5Y1BU?=
 =?utf-8?B?d3RCQkNLMGh5YjlDRFdqVytzR3cxNytYNWxZWUN3Zk1WdHhCbitHRHNQeVZ6?=
 =?utf-8?B?TmFMcHBVL3Z5MHNQRkdBUC9uREhIK3dMSXpIdVQ2YldBNW9JTWVLSEV1b3Vi?=
 =?utf-8?B?VkxqalM1ajUvSlNpM1VnaFkwYzBwZzR0MnRLb2NkRW5MUTFxbk1MejVmL1lV?=
 =?utf-8?B?dU5Mc25BS1B4S3VuS294QjI3MGsxNlJiVjZiV3dUVi9UdkdGcWc2RlN4WmtW?=
 =?utf-8?B?V3dsVXlmcnZ2cDVtQy9FakIvN0tSMHF5WlNzZ2luTXE4a3g5R1B1NDBiMEdz?=
 =?utf-8?B?ZUo4SVFFU2tGUlBUbCtLQm51RTM3dmtpdWlLUmVLYXVYRGRIZFFsZmY1Wk9N?=
 =?utf-8?B?Smx6NVRiajBrNnBhQ2gyKzlFNnZDYnEvQ0hNYWVvWFhWUWlJVnc0RHdmKzk1?=
 =?utf-8?B?MyttbnFCUlU4WmRkR0crdk5iQzNkU3pMQlVMWHF3VGlwYnFKeEZLQUJZUzdW?=
 =?utf-8?B?dHVCR3RKOWtxZHMwbkY5dnJ6L2xEalFpK1JYTG8xTkxaK0xsN1NYK2RhYWt4?=
 =?utf-8?B?U0wyUWduTWI2eURrTlhjam5GNW9BZDJIb0FGdUE4a0xzVEtIbjdSWWwvOXhS?=
 =?utf-8?B?VWt2NUxvVG4rODVJRzBreWNGVXp6ZWFrRTRGdEh0VkpSUGpMR3lEcVcyT1Ns?=
 =?utf-8?B?YVpXaUtDRWRKQzFYenhrdGZ0UWhKMFVla0YxWCtJdFR0L0NzaVRzSFp3SUt5?=
 =?utf-8?B?bHdzc1BpM0tNNDRQU2xnb29PbzdlZ0NmOE1JZ094a0M5UEJxTzVyd3NDK2NZ?=
 =?utf-8?B?U3RGME9OZ3MvdVNxOU5abW14YVA2V3R6MkFPck1VV1daWHNmWW1qc3BFa0k0?=
 =?utf-8?B?c095UWU2NFI3byszWHFmcXNod1hkMnUwK0tjaE9BQUJ1TGJ2QUxLK3BKSHF3?=
 =?utf-8?B?cHZSaHJXdmpBM1h4QlZXdXlFRHFTM0VBNzVLY2RIaDVIQ1BqOSs3ckNXOVkw?=
 =?utf-8?B?RjRJNnNzODBCclRwODE2dUxhUlJkYnBibEc3MU9KYkhXSnl1SjFyLytqbkMz?=
 =?utf-8?B?VWdKR2R2OXVieVFTR1VUK0txeG1DZ28wVzdJdmIxYkxQZCtOSE85Q09YaWsx?=
 =?utf-8?B?U0xwM01PZFVhSm00Mm5wcmVkSDBHYUhicmhPelBBd0syTndKYVFOV1lGbVRy?=
 =?utf-8?B?S1lmY1ZBUEtoNWJWRDhuU2FJY01IZjhOSzBrM1pwaE5sRjh6R2t4WTlCaDl4?=
 =?utf-8?B?eTJ6MlllL1Y5UjNtYWI1QjUwbnFMZURXeVpGbEYvaksxUVI3MUtBb1JpSVE3?=
 =?utf-8?B?NElYcTNPMGZycENFT2crU1Q4RGhRbXBnR0Vyc3FKR0NpSFlsMnhieHB4a2dI?=
 =?utf-8?B?amRaay9QSjkxTER4azhwQ3Q2MDdRQXdGZUw3UWF4M3VqV3ZuNzNLWVJzSkU1?=
 =?utf-8?B?Q0U1U0RLOEFQTDRkZWo2aXZsSXdsa3BXSU1VcGNqMFUrZHowSTFTTlpHWUg5?=
 =?utf-8?B?emw4OXdYOEV3SEJDcWZMWlg2RFBKM01aanVjYVNSSVlZZzV1M3VxL3kyQXNs?=
 =?utf-8?B?LzdXekN4Y29xSGlSdEh4ZzcvWTdMMnZaYmFpL2w0dFNiWUN3eVE0clg2TXhR?=
 =?utf-8?B?T1FkdVdzV3ZoMkcyLzZmRjdZSm1nU2JJRzh5bDlBcGEzejQrV09pcUpObHI2?=
 =?utf-8?B?T0t3ZkwzK2NaU1JhUUdsY3VoZ0R4WFUzU01PK3RScUxYZlc4QjJwWWp1cUsw?=
 =?utf-8?B?T1lKSDIrbGkzTUxpL0JHZEl3MmlnQ2VHZG4xNnMxQ21yUk1uNnJoRkE4NlQ0?=
 =?utf-8?Q?GAUnOcHF7S9LACqEqvoF/Dui6Co04qdvKpFYJ?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 253b4acd-920a-4a2d-4ceb-08de6a2587f0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:57:36.1338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsX74Juar4hgWzFgfTMOZtLzxkkdteyOziyY075mGeQhB+QyNLBrBQCGaI5kNqCIMCp05sUg1ZiNjIWA1qB4RuZBQbf58nP36ERzz3G9tWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11307
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 10:57:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8905

Hi Antonin,

On 2/12/26 10:49 AM, Antonin Godard wrote:
> On Thu Feb 12, 2026 at 10:39 AM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 2/12/26 9:50 AM, Antonin Godard wrote:
>>> Hi,
>>>
>>> On Wed Feb 11, 2026 at 4:25 PM CET, Quentin Schulz via lists.yoctoproject.org wrote:
>>> [...]
>>>> diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
>>>> index 907ecec55..3e4045e7e 100644
>>>> --- a/documentation/tools/host_packages_scripts/pip3_docs.sh
>>>> +++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
>>>> @@ -1 +1 @@
>>>> -sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
>>>> +sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton 'sphinxcontrib-svg2pdfconverter>=2.0.0'
>>>
>>> pip3_docs.sh is not used for ubuntu and debian, meaning we need to find the
>>
>> Woopsies.
>>
>>> equivalent package to add to
>>> documentation/tools/host_packages_scripts/ubuntu_docs.sh, or write a custom
>>
>> There's none as far as I could tell and even if there was one, unlikely
>> to be 2.0.0 for all Debian/Ubuntu versions as they are generally pretty
>> conservative with upgrades and this was a recent one.
>>
>>> pip3_docs.sh file for ubuntu/debian.
>>>
>>> Or drop the ubuntu_docs.sh file and use pip3_docs.sh for ubuntu/debian, which
>>> would make this kind of mistakes unlikely to happen. What do you think?
>>>
>>
>> I don't mind either way. Makes it easier to maintain if all use the same
>> packages from pip is my opinion.
>>
>> What would you prefer?
> 
> I prefer having pip3_docs.sh shared between all. Do you mind deleting
> ubuntu_docs.sh and replacing it with pip3_docs.sh in a separate patch?
> 

Working on it, and I'll check that the docs can be built with all 
containers this time. Good catch :)

Cheers,
Quentin

