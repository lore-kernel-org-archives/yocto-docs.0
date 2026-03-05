Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6AFF3094D
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:49:43 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42548.1772711382385083271
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 03:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XgTUPnBF;
 spf=pass (domain: cherry.de, ip: 52.101.72.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjXumGPCak59z556osFBf+uQhIx8R8Uu9Cug8oppUVZijsAhgNZNYFTM+bgGvuRzfuwWkMUF23pXCrRdqrQhJgzOCSPd9NTiHO+VSo6kQ04No2OodhnrEwJVCYlSDhahaQhkOZxxF1mdhe2p+VAoI96jGRMDgkQOk4lOmw1mXvaie6DHZsYGpuVvjf146mMxK8oRk8yXdzK7615TsHsUwrL58M+cKmpby+ON2bHTNpBI5Od1Lb8VZV2mp218K6qxTlbR0OnXoxMrKBSZctka6H6+lm+LF1H+tnPI4XByBa8H/AcrGF915GEMPtpvbvpPE4wNwBJIrcDZTxQROtPV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8KfHWVe4mnrop0in4eLxeg7yifh9jsjMhCveHD+5us=;
 b=wVEpNGWeaWfJtB9ySVk/IhCdnqaWVjqBNw0lK937mwTUcThBN9P/rr6YHAxBA0v2drbClSudraob5AVeLKhTVBFP8LG516Qc6xAUnVRcTZ/Mbqc1mDhvPTbwlYVK3fqyotqutq04HCxHiTf85tdm7gektyuNTgezZ/cJOF+QHU+7Ofo1Kziw1wfqErg8NnNsfLz3PJjfmbMvnhV//kZqCsb+fnyBYcNpExpiBdaYln9JXSpcYnpoFkSONwRfddGI5dsaNnrj8zhlvW6MI+jSG81PR62Vh2Al6iOpvhwwBbQpDpz1gZ6YZSwWqlUtthw7ZjWVLvSa4TOSoY0OFMBmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8KfHWVe4mnrop0in4eLxeg7yifh9jsjMhCveHD+5us=;
 b=XgTUPnBFlGLDrlVx3Yx+rrNKmBoS+EGoO+gL4VN/j1Q/RcLbcJ9DJVoM9m+jNZjwOyQfSaBVPdJ+tyhohI8GiyaRt0psmz2MPmccrs86UdZc+gqgPFN6NAUwWLiJjDI5DiYVjyqphIbInH+R8Qk+NOFzrUZFDtogeCSZng7ylOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10077.eurprd04.prod.outlook.com (2603:10a6:150:1a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 11:49:35 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 11:49:35 +0000
Message-ID: <bf61bba0-d016-4860-8ce2-6d2d22ac3066@cherry.de>
Date: Thu, 5 Mar 2026 12:48:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 8/8] ref-manual/faq.rst: remove the CVS proxy note
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
 <20260302-release-notes-6-0-v1-8-9662dee58591@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260302-release-notes-6-0-v1-8-9662dee58591@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10077:EE_
X-MS-Office365-Filtering-Correlation-Id: 573c140a-5453-46a1-a4db-08de7aad460f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	Yc7AnM2eGbz+Fy815ZWckcSuhWezE8SbM1+spIVIrm4qU4CJaT2v0xtuMYvDk4f3zlNFvduBWr0rXZKnpT2Y13Iv3LSvJ1mAYiU03xIrrUhkG661qtEniWhmtf3bDlr8BhM639z2ytAIzHE/9ptfQwETOtsibXjPfYXfV6y3jIGYZTTU4KfJ5dD3kqpCG/6nT3fNjclcc1EyYpFidLALjgYwGnRVpxidCQAGEr4eh3e6SNwrcXcnK/k4NACVhocD1TyVEilDJasd5W68w2ophIS2U0Z3XlPbG2tqNc7DaF/XpXuYlKCxvlZ7AaMChPv66xRjaQmpVE+9uln1HTgzX1dO5T3JUAiCEVcJJykk9Vnuc8J6Sgv2VezhNHXwCP4KGenjBOk4R8dtFKK9vO47DvsgDBSesq2OUyTnUoqTtWYIqreKVafwMHH+OgzaIkPtRSb8fHYCPk/TlZKKAps7jeO9iGXYikjiLPXoarEKv4rHRrDWdJc4H8gii5PbaEuL0P8HEXNDDa7OT4pBJYCdWHsJo3j/3uwvHVRPOQO4hDQdph7BaED2kTEPtkJBYmgDddotwvW3omm30uAR73W4duWcMXZAzlGcFaSIcNyDu0fZxWFnxyGh5mtMmhK17qIe2VEJtwz6g/OGcKBYl0wlaT3To9h6ls+cqGy0HUIJnsVrKrtjP7xXf2kJDPnSmWcGeGPamD9vUtKXljXb3APxwcUgeKUR2J/oxuLBEal2UZA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YSszcStBdmlHbkRCZXJKNnljOWVXVWhPUjZ2dFFoT3QrZWt3allxYzZqWHNu?=
 =?utf-8?B?dEZpYzAxK2J3Y2hIQWNWdmh1TVUycWY2cjhSY2UrUEJSL0Zwb1ZJeHFnc1Bh?=
 =?utf-8?B?bGdXTVZtc0Q4eVF2U1MxWkpyTXIvbGd3bEFTVWZhRTJPYm9lbWlGd2JLZDVh?=
 =?utf-8?B?V1pEMzFTZlY4TnRFMHBnZTlBS1Y4T3RGU2kxdlR3N0tPMlgvT1luVDY2M2Nr?=
 =?utf-8?B?eldCZUw3dkxlNmV6Q3NhNEdBaUkvL1BSdC92OCtYbXorN05ONCttdEVmaU41?=
 =?utf-8?B?ckIxbDN1TW5LSHJrVHRqSG1SYTdST2s5dVBIYjZlN3Vudjk4NWFRRGMxak9n?=
 =?utf-8?B?NUZKSUYzU2ZGdUhPSU1kdFdXU2EzYjJXTUs5NXJuWnRaWklGb1FyMGdiTlF6?=
 =?utf-8?B?MEppS0ZLVVlvLzh6azJxMGhOY05rWEY5a3hGcWFGRm9pSWk3aE1BMG5qcHA2?=
 =?utf-8?B?QVFMeXNVQTNjMWo3YVA5VVpkbDA5Mk9FR2JKeHlaS1NVK3lNeElkZWpyQk1u?=
 =?utf-8?B?WENleHhtaElQMHZCSEJ6ZG1JTmhtbWZJb2NabWNMdXRBQno4c0dJcURrd2x0?=
 =?utf-8?B?bmVHMVFJNnFjUkFkUVlOME03VWt3U3BpbWxEMFM1eWQvSWN4Qk1nL1dVTEVV?=
 =?utf-8?B?SkFJR1dTU1FCWXdQdEduTk5Vb296ckJvTUJGZnE4L09YSlo1bDRqRjBsNWRN?=
 =?utf-8?B?Y3dKUHVQU0pmSk11TTFsdVdEeUg5R3hMNlMvckpyQnl4ZnIzdVBBM1JydW5Y?=
 =?utf-8?B?UnkzY1pUMnJxc0lzRjFZMHBNOTI2dWV2Q0lEd1RPajVwTWg1WkhGSzN2Vzl6?=
 =?utf-8?B?bmN4RWlCSnpBeXpwL1E4V0RVV0VIdXY4dnUxWllzRDZWOUM5NkRCVkFNSmpB?=
 =?utf-8?B?L2dNSlQ3TjRjaXFwYTBja2ljVmpyODJTc2FxYmtlTzQrRG5tQ2Y3bTI0clJY?=
 =?utf-8?B?eXFjakNnUW1vWTBBR003ajZQYlhySnl3OG9ka0hsdk1KMDcvZFJUTEJJQUtP?=
 =?utf-8?B?eU1VWnFQc0UzK1FMQlhpeDdqeVV5V21wSzdOcGp6Ynhzb052Kzg2S1JBcHNw?=
 =?utf-8?B?dlpXVS9vYUp4c3JLRmIxbEM1QTB4ZDc1YStHbXBmd1VOUzFCQlhyeXIwb1hx?=
 =?utf-8?B?TjRIbTNWN1VGZ2NnYXR6QWUyVzMzSFlxWG5lOXZNRWFDdEJVbHUxaVNTNk9o?=
 =?utf-8?B?WEJmWXVLUHd2N1NiV0JYUndoaThEbFV6ZE9Kd0FvYW9FbEY2VWZWM1dNblBu?=
 =?utf-8?B?OXU4TkdiSWNlbExaZVlzZWgvSDZEMU1lK0ZQVmtMOGs1bTZIMGY0a0VPSUZ6?=
 =?utf-8?B?NFhySUR5Ti94T3p2VXZESUUvbERvY2VsdUdDdFdwTTlCVHFYSzloNVpCc1Bj?=
 =?utf-8?B?WlRYUlVrMU90VFVnUWRJRVN1YksxdU1Vem5qU2FYbGJITnROOXlrWCt5UzFa?=
 =?utf-8?B?M2M5dVR2VUVhNFowZGV0eDZLUi8zMlF6N0xtU2hBMnhhU0xUUEVwZWVMWnVp?=
 =?utf-8?B?QkNJRUM4UGV6T2FGU3pDcXJLUG9GRHRDaVp0Uzh5UG5OSU9jU1BWdXRtZUV1?=
 =?utf-8?B?dW0xVnJaNjZhT2E5cEFQMGppNGZTNWRpZlNiU2FXWGVPNHc5YXB3ZU81Wkxh?=
 =?utf-8?B?SS8zNloxcEtTeWFNbTNSS3BYSGJpRXptQlFWUGh2OVNMZkYyQ0FmS2ZXWXFV?=
 =?utf-8?B?UWt5WUVjMitTSEg5SktjcHVsS3hvdFVNQnBNMG91Zkx1YmM0WmI3b0FSMS92?=
 =?utf-8?B?aHFDY29GKzZBNWJscGdUUVl5OWdGejk2bGZFS2NtWEJYOUFrTnBZSUdreHBU?=
 =?utf-8?B?U2VabHpQaGtIdHBFTlFEbWMxbWlRS0pZcndBTFJpRlQ1ajI5SzBJc2UrNTVl?=
 =?utf-8?B?VUV0WHZmaHl5bStqNGNTZ213bU9OTlowOUtOK1dRUjJUMHVHTkVJMkUzcyt5?=
 =?utf-8?B?WURwY3hzbk5obU9nRU1mUGk5dm82YUdIcVVrWW9XT1JKUGI5U2tLNXpqUjBT?=
 =?utf-8?B?Q3Y2enhSaFhTTE55OTB6cmMrU2huZlp2S3orNmJXVUV1akJCM0lKVGQ4bk40?=
 =?utf-8?B?ZldmN0pSS3ppcUNDSXRUMUZ3cFRXOVZEUkdpNWN1NVhvWVk2S2FCaG9OVVlP?=
 =?utf-8?B?SXBSVEFwb1RjejNmUVBNSmNlR0IwbXFXMVBqM1poWWRnd1dlTG16ODhOZEJ2?=
 =?utf-8?B?U1VqNFU4cnh2VnFveEl6YUtRcnFrT2phOFJRb1orNDNDYVo1Q2lkMHdYSjJ2?=
 =?utf-8?B?VDk2VjRseVZBNHpZRmRKMVFzb0VwQkxRMXQ1VElkMDZFKzJUZnlDMzRCaEdQ?=
 =?utf-8?B?eEdEbnAyWmxIS25BVVlPS0hldnZwbHR0b2RpWnp2TTVqZ3dHMUVFNjVlbVY5?=
 =?utf-8?Q?XS8pPZN5+ELB5fC0WBd7JtmxOd4K6nza1GEFI?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 573c140a-5453-46a1-a4db-08de7aad460f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:49:35.8117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbBMxCjLhaRILy3mlbdUJwgymnOSMpv7rCz2HRspu9IvdzH/BpMNlIBYBoNPOHCCs3wKYPMXDPIQs98NcVFpOvCpn+m/ki7rVz5whUK/kBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10077
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 11:49:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9067

Hi Antonin,

On 3/2/26 10:37 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Support for the CVS fetcher was removed with 5427500e4f23 ("fetch: Drop
> CVS fetcher module") in BitBake. Remove the CVS proxy mention.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

