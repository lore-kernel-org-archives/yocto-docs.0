Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1182D1AD4F
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 11:59:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.101])
 by mx.groups.io with SMTP id smtpd.web10.20860.1729079988856732985
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 04:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=B/MrtFqQ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.101, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plkggvvrxSBu6LMw4d/PUM0TPp0JAsfEQ7HBGn54H8VRlkmcMzmVTuVzNwCTFfXcvqvB39v22HKukqqQmpkyqpSFIll1z94xhHCvMHiUQEqCgZHFU+/1/8lFD5S+N/R6jwld/r90BLjI09Ez3Tnggq3M23jhB8p4bkh2mw5KuIUk72OyDHDMUYrPrN81y3JhX3ROPqJoVE2YsRn0T+QtADi6GErQBl6XTzhgiG9qYF4ucpJSzpztVgke3GW/FK3iXO5hxA+zBDG0Yf/WJ9mPhjSB7TwO5axOB7MsdSqNsH/ujD6ckne2xWuBXG4gh1mhVB3A1ps6LvyjzD93Nbei1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvwoaQWM4onza2tCig1dfUbbGqZ4wYBPZjspnK4CHgE=;
 b=f0Ddkf+wmvUtWSvQsrX5c290dtjXJtsWxCaQ3sv3vay+3e/n25SUBXlTXf/f927+LhreL4DA6CCL7s1ad1veOgTftC0oYPgoDwT78XXElQNr3LLM2umMwgU5NJa9Ca14IW6MK3gL0t0x79xst592X/wmxIvy9LsIzriyWn4ylI2TRXOsQPKhFFf+mqWDghq8QSGIiE/ehbZwC+Up+h28EZL+FxwPOz2ZeKOFhz4OaqpFRzru0HNjBCMOdpYg+SD2nuX7qcKy9R3ubfdNtx3LN2FGmPm//WX88IJrAP6Eb6F9Nnl0KBADMbn6TKELvBq/EKDNPqhBYmzdNLxyRmh1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvwoaQWM4onza2tCig1dfUbbGqZ4wYBPZjspnK4CHgE=;
 b=B/MrtFqQkFJkYpB1+d4KTmhxVpwDcGSS/RSeV5M5y3Kh7WToj+8wnBIJci0tjvnbgXKCbkX/UdoaeoEhGp/Ky84zrjMGkmJfy/Spz8qz8xRkjA+nY/9DcRiDI52AHc69MZQ48D3Ouy5MW9sd4DfNdPqWgpypbEpNvH43K0LJt5EjILitTDFYqg2JGy0IYAvQltsN4aAcG1EwBxAT2TOJQYy84zfdQYC/UVqCbvcK9sxzFhE4yAw2xSZUV4vz3X9CautNUxQlr4U0X6YEOH7ZNm3JauOUo4QNDEROSM/mzkE5sH+hapXOtshDkQQQziK1AVK9MP7xsKuzEsxU30uoRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM9PR06MB7955.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 11:59:44 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 11:59:44 +0000
Message-ID: <1139a7eb-aa3f-429b-a3f7-d4411f43facb@vaisala.com>
Date: Wed, 16 Oct 2024 14:59:42 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCHv3 1/2] docs: Replace VOLATILE_LOG_DIR with
 FILESYSTEM_PERMS_TABLES
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: quentin.schulz@cherry.de
References: <20241016092340.262802-1-niko.mauno@vaisala.com>
 <D4X6Y2HFLZCP.2XXEK9388STXQ@bootlin.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <D4X6Y2HFLZCP.2XXEK9388STXQ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF00002BB4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:9) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM9PR06MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: af919b60-5fb4-473b-7065-08dcedda0630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VXNyeCsrOHNtVXdXMVU1NEx1MldHMDhnZTlRSnA4ekhKZGRGVFl3SEpkbDI5?=
 =?utf-8?B?b0FiTHpNSHUvdmI5MjRGc2c1OGZwRkxMM2ozQmlOWm1uTi9zK3l4VktjQUdz?=
 =?utf-8?B?MVRuSjBRSUZ6TUlXWFR6ak4xQTNyNzhOOGQ4YmR3TGZFOVhOODFuNlZsa0tr?=
 =?utf-8?B?MUliV0Y3YWl0TkwxamNOOEIzcll0bzE5UWZKL1UzRG5QUmhLTEJnckJtY2RM?=
 =?utf-8?B?VlBCa3N6RmdNSkZDcndNeHgyM1A0UGxGNE14L1k0WmkwT3hFeGRFS01jd2lp?=
 =?utf-8?B?c29DaWg1RzRnRWVURG9zMlRPbkF0RWpvYjQ4dmtMS0o4SlcxcldHZzJYL2lM?=
 =?utf-8?B?SjhCSG00dEJmRkMzSkJZMDlPYjBScXRNTmg3UDdzTWpCT0hKKzJvYmptdGs5?=
 =?utf-8?B?enRET1RQTmNxcmhRU2NHQ0tLZTdLdkRlL1AvUnRyOWcvZmloY3RXdXFONGJu?=
 =?utf-8?B?dEllTW1MeVRLWGVneUw3d3FveVFvYmMwV3NLc3Q1eU8vTnZZcnNEVFRBTWt0?=
 =?utf-8?B?dnhsaTB6c3lOM0xQTGJXY0s0ZzR6NlFFWnd3MlRFdFd4OE90ZlJCL0FTMXQ1?=
 =?utf-8?B?YVVqZEhWNXUvaU5MYkp6MVpidFZKZW80OEprdURTMThuZWlaRmltdUt6WjZN?=
 =?utf-8?B?U1B2bkdzWEhzNHBXNFJXd01jbHpVSjZSNnBDeE5tUFVvU3BsUnUrUmlwUjFF?=
 =?utf-8?B?b01leldmbzFaaGpJMmFJZE8wTzRJWGduQTRmd0NQOVh4eHZqWFBZbGk4dHZm?=
 =?utf-8?B?cTVERGQ3TitJUVpnSEQyaUpZVVR5Y2g2MGlKdnBJS1U5aklsZ295Q1p2T1lz?=
 =?utf-8?B?YXJCUVhHeEVObFBWNTRkOHNEUGNQUVZVUW1mLy9EZE1qbFJUbXNGVitRMXlR?=
 =?utf-8?B?aUIzN2xwc0RhcytRM2lSczF2M3Y0U291YlY2emlUN1JDQlJxQzZQZkxqTWdY?=
 =?utf-8?B?akRDU21DWVRMTWdvZ3JvbC83OTZSVG91bEpHQWxGZEUweHlYL25PTHJtTzFN?=
 =?utf-8?B?WmxkWnFkNEE5Y2pvdzQ3UFdIRzBLTnNBM0l5Y3NEaFRUc1lEZEZnUjNLU0Ur?=
 =?utf-8?B?MFc0QUVSY0huNTZ4Vm5McTJSa3lkV05xa3oyaUd3WnVPZlpCN0NUazMrWmp1?=
 =?utf-8?B?MExaSmlPdXFCWXZMRWhkcVdYbDZYaDFCdzg5T3dhOTlrZU9DVmVyV1ROV2Fm?=
 =?utf-8?B?RjRPeWhaN0dvN1RhbUQ2NkRlTGFuUHBSekxCd2o2cnVHVzFHdTZaWE1mRHlW?=
 =?utf-8?B?ckdseE1sRVBVNzUxd3Z3RXozczRvYUxxQUpjdXI2b0JQZDN4enpIL3dES05t?=
 =?utf-8?B?cFNHU0JCU3JwbUZVaS91TGlXOTh0dFVVbkVDazNFUGNkbHZseG4vZkJub3lo?=
 =?utf-8?B?WUVYRVZ1dHRpLyt6cWJROUs3N20yeHU0dkR1ak8wVld5Zkx5R1NLWEZ1YSsz?=
 =?utf-8?B?YnJGR0VWVHd1U3hZRUVGakI1M1FxenR1emNNSXlRblc1bmdUbkhiYjBnZWtG?=
 =?utf-8?B?ZEVLTzBsMTVlYWF5WllFMFNxS1hQUmEycW1KVkhyTi9MTnRDVVU1aFI4R1NU?=
 =?utf-8?B?ZFc2ZFN0cjdqKzdqY29Mek1WSWRUbGN2K1RGN0NaSnMvbzAwNC9yWXl2UVhm?=
 =?utf-8?B?dUZiRDFia0QvUCtXV091dHhtREhpM3FsL2VpYzZmNzN6dlJ3emlheDEvandX?=
 =?utf-8?B?YlZaZEIvK1F4M1ZPbXpIcU0wRDJHd3BSdk1HbTcyTGRGSnZCRWNMRUVnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXIwVWcrQlBaeGpuUkJvZGpUZVNabDA2Q3J6RVptSHRxS053UHpFRkQ3Vmpq?=
 =?utf-8?B?TUk2Q1ZyRTdMWHdFMVdxTWxVK0JKMWtpalo5NllzTDJZR2dWOXVBbGROTG0r?=
 =?utf-8?B?dURHSXRYZmFHZTFETVFrbXZYMjlNcDJ3cU15VWYxazFDNi8yWmFucnhWcHVj?=
 =?utf-8?B?RGJhVmF2RWdHTXN0bHB2VlZTSjZOYUgwQkpMVWdPSmk4NDBLWGxnU0I5dlI3?=
 =?utf-8?B?WFk1eVNPTUdmbXppL1JaVW1TdWpLYVR5U0JwK1NtUEkrL0h6dXNpYVdDUjBH?=
 =?utf-8?B?Rkp5SmFTandhSW5Ra1JXRUZIbnp6UVMxZmFVQTBqMlBIOUIwckpvSXBPMHBi?=
 =?utf-8?B?cFJ4bHI2M09HaGRCY3pyNDdLa3BURHRqUGJoNVRUY3FEZWdSUjRGdjBUWC9t?=
 =?utf-8?B?MHNaMGJLams3MTJOcmNpVXkraE4yY2VOeEVzODkxdDRlaW91VCtrVkdSWFN4?=
 =?utf-8?B?cEVBdFl1UmxyYlZiTEhwUkRCWHI3dWRVamN2ZUxtdXpGeU9MbzRwKzRLeW1Q?=
 =?utf-8?B?b0lPaDZzYXorWFJWSU1ZNnJNYi8wZHRWYzd1ZHJCbmNPcDZza0k1bHFHYVRJ?=
 =?utf-8?B?SzZmaExjUUVrN01kYjlnbGpYNkN5WkI2WHE2OE52RTJBUFVDWFRkaTFYUjFJ?=
 =?utf-8?B?QUF0YXBGazdXa21qSVRTa0Y2TEQyZGlSUnFjbHRTR1JHVkFPSXF6b2UvLytY?=
 =?utf-8?B?bTVsb1NVWDV5aGNvaEVaRllDdGY1MjdLQnZrNlI0ZG9idkE1UzZ3d0dFUnhH?=
 =?utf-8?B?YXJZdDZDQnd0K1dLazRhS0QxS2Y3VVFmNE5ZK3MvZWNrdFcrV2tYdU9sbWRC?=
 =?utf-8?B?MjFWWkhJRzJxRWZxNTlhRi9udVlhUXlFbTVadXY1dE9LRFBqMHlsWC8ydzRS?=
 =?utf-8?B?ZVhjbVRyT1o0ZSs2WG5BQTlCSkhkalA3bHNzcE54cTJlVTFTOHVQMjhsWndJ?=
 =?utf-8?B?Y1lpcUIramxXZ2J5YTZDeGVOdDQ5OXgwaGE3S0FFS29uYjN1ZXF3Q2E2c3hn?=
 =?utf-8?B?WDhvUWJEOHJMRXljdFpNa3B1OE5rcXhGUFBVNjRGbzZqa0hleTZ5bmJIbFdy?=
 =?utf-8?B?Q3M1OWRpZ1ZxNUxPOHR0L2NlU0E2QXAxZUFaY0szaWh1WklYTVc0L1Q2SURt?=
 =?utf-8?B?dnFvQU80YlgvMHAwVk9xODd3SGFLYjlmODBnZzg4MmVERnp4dEpwYVAzZHFT?=
 =?utf-8?B?d245eDVFVGE3a2xWeTVxbVFZSEhlZWNCQ3U3MFI3RkFRVnhRSVJROGxNY1Jj?=
 =?utf-8?B?ZU1ydXJBeExCa0dIZnRSRmM0REJNYTJRdHF2dThybm1wU1J0QXhhbjJURVBP?=
 =?utf-8?B?dTJ3OENVVUJ6U1I4eVBoVlZsUjVna3NJaVlORUQvcnBvNnpNYmdDaVdQa2ZX?=
 =?utf-8?B?NVR2VEZNY3BZMWF6cktYTjZmR0IxbjQreXVRSlVpYW9nMTFuWUtIVHNkWEpr?=
 =?utf-8?B?aTluc3FVNG1NckNMYjJnWWl0Tnk1ZElTZGxzcnlldVZvUTZId1BPMVIzdjNQ?=
 =?utf-8?B?dFBqb1dRcSszK3FCOFpvNlFvNEcyNmF2b0FlUnlZakFWZmJDVHZQbFJNY1Qw?=
 =?utf-8?B?M25vSG9STEduYTVsWHkvbFBmOFBVYnIrS1hOSTVZUlAvUS9FNEhnUXNiZ2xZ?=
 =?utf-8?B?SFhsaU1ubUtrbU5wWTU2QWY4SjFZeDZYRnI1YXJaRXRMSUxnczNNOTB0OUp1?=
 =?utf-8?B?YnJOYlFTK1YzZUJEV1VpbHBoTmJTS2p3SHNZRG5aYTJJMnd2OEYwdndsY0x4?=
 =?utf-8?B?d2V1Mkh4bW54WDlpN1N6anc0aHROYTB1SnlvMjg0RWkyNjcwWFBQWkFKcGpZ?=
 =?utf-8?B?SEJKTWc5NmNGZ0E4NFFWdlhoT1pHdXBNYnVkS3lUa1N5Ymo2RXp0U3kvQmY1?=
 =?utf-8?B?eUZjb0FwYjJJbkp1dVIwWE1aTDFDcEZ5eWtHdFJpaElzUEZNRGorZE5sMGEz?=
 =?utf-8?B?RmliZjNkRXdubDZnVUVXUW5NR3lSeGVvaWppcW9RME1JNXRlOWVENk5Xa0pu?=
 =?utf-8?B?Sk9HazdIVkkwcjJjV2MwUXo1VGl3aUM3aHpuc1hrdE5LeHlvQStKTW5rRzFK?=
 =?utf-8?B?VzNBYkl1OFRydlZvbVlqSTM4U3lKNGRHQUFvYTRWMkFaSXFncmNJMnpRWmg3?=
 =?utf-8?B?cklrZWpDS21oOEp2SnhPaXFFOXpWNEQvTTJncXRyZ2NhKzVDM1UzSEJuUk54?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af919b60-5fb4-473b-7065-08dcedda0630
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 11:59:44.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbP3xqO6DZpoxoPSPnTuvc6Z0wAeLulyEDvlKGmKikCjth8DtOadHbsL9iGI0a5OSOaz+NXiueN7oXieuT0c4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7955
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 11:59:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5504

Thanks - submitted v4, which restores the note followingly:

     .. note::

-      To make the ``/var/log`` directory on the target persistent, use the
-      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
+      To make the ``/var/log`` directory on the target persistent, 
remove the
+      ``files/fs-perms-volatile-log.txt`` value from
+      :term:`FILESYSTEM_PERMS_TABLES`.

-Niko

On 16.10.2024 14.24, Antonin Godard wrote:
> [You don't often get email from antonin.godard@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Niko,
> 
> Thanks for this new version.
> I think we're almost set, just see my comment below.
> 
> On Wed Oct 16, 2024 at 11:23 AM CEST, Niko Mauno via lists.yoctoproject.org wrote:
>> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
>> index b2ba731bb2..84ebfa81ae 100644
>> --- a/documentation/ref-manual/features.rst
>> +++ b/documentation/ref-manual/features.rst
>> @@ -325,11 +325,6 @@ The image features available for all images are:
>>      the ``/var/log/postinstall.log`` file on first boot of the image on
>>      the target system.
>>
>> -   .. note::
>> -
>> -      To make the ``/var/log`` directory on the target persistent, use the
>> -      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
>> -
> 
> As Quentin was saying, it would be nice to avoid removing information here, and
> replace it with the new implementation. I'm fine with keeping an explanation in
> both the glossary and here, so you can probably paraphrase what you wrote in the
> glossary.
> 
> Thanks again,
> Antonin

