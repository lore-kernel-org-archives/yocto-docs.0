Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B9FE77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 10:34:48 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.67])
 by mx.groups.io with SMTP id smtpd.web11.7243.1733826880528966195
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 02:34:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kMF26ji1;
 spf=pass (domain: cherry.de, ip: 40.107.22.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrgRNHaX55jDj0D3kP4f7XvqhvIiSqmvSuz8CuWEziRUygHXFrr4AwXdNfp7YSwsma6xnEC8RsjxgG1e9h0VclrGb2HOZ5DCYoL5UxHxOmdQr8JH//uG6Ak63yy+m0gjxiYzuu60Le6iNKxMw9Wpl9MV/MLk2oWd7s1HuGCb2JFOAfXOluthf/I+AsR+W/AgwZGO//vio7uzAno3zB7fLWtq0bx5yGCycLbm4rKGl00Xer5WGqTkYIJLlZlNBrpaUmXyurbVoNIVxBbSwjI4YQEyzufQnrovtvuJs9qohSpMuUW8KjJJuQm3R1uIdMvajcdSOSYsxI+17ZIjzVd1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBrl06IxR0cvnNzH/tHzhNxZE1jnZu3sr/2p6Pr3Kqg=;
 b=uN80S4jeXxAkhLs0nbxPjP2QZs68sPjBaxc6J5cWG0ERJeW6tw8KMsHh8aBRDfPsceg5mS8Rw809t62rq8WAAvWIq01oESt5QPVlkBujODdEE3hpAGIyqcYurez2uCsFabZ/dGSu6E4Xg4SeBbkSVG0mQmt0EJ+t9fLe0yRxFZXeKGAt9Hb+Vlk9R+IIstET2/75HywjXyzkt1W+W4FGOGOjB8GvY4NBri3kmkMv3dWMpY4Z2nTb5RqTCNFw+9SyuYQxM7EE1VjgYRqA0p7PN4QbYU0G9QcBm2y5ua7dkVC4H+TY1jI23s0udUqv/ppNCvAtLENJabQ+tVEUJGKslg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBrl06IxR0cvnNzH/tHzhNxZE1jnZu3sr/2p6Pr3Kqg=;
 b=kMF26ji1HxkeN6hAKwRKv5nIoNswPTSdhE93btHj/y9d30kNKfKegRzruVf0mGvGUib1Kh5YiuGYZUyjC7+PJMHASumMBp/CxHcpAgk+K0cR2moWqyEkgo2xz5gRpqR3Gzin4kPvbhXK0wG2k6tNMIa7jXcXtTc8z+f+/JmgnMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8161.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Tue, 10 Dec
 2024 10:34:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 10:34:33 +0000
Message-ID: <c10c5cd5-6d1d-4022-be68-5e998b22896b@cherry.de>
Date: Tue, 10 Dec 2024 11:34:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH v2 5/6] system-requirements.rst: add
 dependencies for pdf builds
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-5-1d9b4063476f@bootlin.com>
 <f6b0c418-bd94-4fc2-a58d-ec7634926fe1@cherry.de>
 <D67BY6U5UGPM.B2AQ5R5NXNID@bootlin.com>
 <50f1c8ad-6726-4b14-a440-043cd7a47077@cherry.de>
 <D67X1HPUBY1E.1H5DBU4OXAURO@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D67X1HPUBY1E.1H5DBU4OXAURO@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: f300ce19-eb35-446c-6e59-08dd19063c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NzV2bmwza0p3cjBvWEZlQUMxbDBOU2dqc21rNytGYklWRFdua29RSjlHOHBP?=
 =?utf-8?B?b1VQTFhJOUk1RU1rOGlUeEJLQlJieDhJNWlzOFM2YS94NnZOL2NCakFDcjQ0?=
 =?utf-8?B?bEFQWjdNaDFydWx0WDlSaFpHOVdTRWhUNG56SWpDUGFkdnhZN1I1TVZUdlFP?=
 =?utf-8?B?NFZZVWdNRGV5MHBCRUw2MWhwUEtJNWMrRVRSQUJ2SEVYT1Fyd3B3RE1UT3F0?=
 =?utf-8?B?TG9oREhka0d2SlFzdzVnU1UzUStERzU5RE1DaG4vY3pFMkduaEswWUtsc09H?=
 =?utf-8?B?RDdURXM4YUNLUEZJR3VEazZnQ21SdTJkNTlzVkxHNTM0NmRMUmFObjBtUDBN?=
 =?utf-8?B?NWFkQ3IxdFVrY2hpeWNIYTFRc3BTMGlVd3VEOWtqNElXUzJ1WFpWNGJWNGIx?=
 =?utf-8?B?M010NWxUUzRvZ3N6RzNoUkNrT1VmenV4aEZpTjZNaUVYZ1dEZHRjRnc5NmVw?=
 =?utf-8?B?eEFqdUFTMG1vOVFZZHQwM0pOVnRxQzRmZ1ZBckdrTHdUc2tXVnlHNnAzUW8w?=
 =?utf-8?B?dlRzdm5kOGJyd21iWnFmZ3dpeTRFc09SUTFJQmZ2ZEo5MEcwSUZ3ZUpLQ0hS?=
 =?utf-8?B?enRNdW9KYi9MYlpHTitPVnNJSkZKcUFRUllRZTJLNE95NGNrczFkcFNyNDVi?=
 =?utf-8?B?RHl6S2ZNSzJ1Zy8yOG95WTVrQXdYTGVpeUhUSGNGTjA4TFBmZnlYVG9UVjFz?=
 =?utf-8?B?SFIxTlJ1aUpFVTdRMEFSU0h4dDdBZlZwVENEZlRmVXRvVXFHMHJtUmVGZVlh?=
 =?utf-8?B?RVRzMnJxcFk5bWdhUTh1ZFg2L0swb252S1Q3SGtudm5oVUZNd3dJb01saWls?=
 =?utf-8?B?UytGWFhCUFB5WExiaUtwKzg2R0VLTVl2eXhZd2lHQUI0WG84a0Ntem9GMTkv?=
 =?utf-8?B?R216TXFtdnd6eWtrV0RXc09FVHBLMis2YUdUQmNiQ1VmMXg5ZU8yUG1tQU1Z?=
 =?utf-8?B?ZzVyT0RMTWc0M2JvQWhZSk9oV0FBVTBtQlF5ODgyTVQrRnJQamNUVWhuWXhl?=
 =?utf-8?B?NmJzNkhYU0JWVUNKQytpVGswdHUvOXJRWFU1R2R1RlV0OUJvUU9YLzc4eDc2?=
 =?utf-8?B?Y3l4dmRzUlRRN2FHWDBHb3RoMGgvWkZ0UXliQk1zVmhtTTJlaThGZFJHdDFJ?=
 =?utf-8?B?THdPNUtuQ3ZKbDNEemx6YlpJbHMyeGN5S3h5TmFPdzBBZE1EQUZLY3d0cmFY?=
 =?utf-8?B?QUd3bmFOT25LWGxrNjB0UUhMTVBTZEVPMjBabVF0eGpZMWEwd1NCK1YzYlJY?=
 =?utf-8?B?V0hpZ3JYdzVCY050blQ5TldGNC95UGNEUXREcS9jaFV2Y1ZwOW04UHgwSFdN?=
 =?utf-8?B?M3VaSmx0dE1idWwvbXEybHpwemQ5MWtIOUtMVTJlaW80T2FNamk2SUNoU1VV?=
 =?utf-8?B?RWNxajQvMjZ1eHUvbU1EbXNwaEFUZi8vZys3aU5XY0F2YTVIRXNOQTFZQm8z?=
 =?utf-8?B?aTVFVnZtYmFhR1hiLzI4V3FjS1lnTVRZMGV2OCtJcDVtaU5ka3krbFZUdzlS?=
 =?utf-8?B?RldiNldFNnk0ajVaRmdoamFmdEhnUG1PdE9pU0ZoMnUrM2pESTJmbXE3OFMz?=
 =?utf-8?B?eThPRm9LcktHd0UrUCtDZ2JVSzZvS0hjZTluQU54K1NrV2hKc2E1Zmg1Wjdz?=
 =?utf-8?B?SkcyM2dJZjRYNU90WUlaSkhEa1VRdUlydGgzT0NjQm9OY3Y3WjhHc3QvUkVT?=
 =?utf-8?B?cU1oYms3S1hnKzV5VSthcGl6cG4vQStrSkNpV240SkxDUlZkMHBtYkR4WjF4?=
 =?utf-8?B?RTVlOExTb1VVTmVJMGJnd3ozRC8xRDVQSUFScWhXYjlORGFZQ2VMdXlTL3Vw?=
 =?utf-8?B?dTJSNDFWbVJINzltVlNFQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QkhscG5pRTNBWlNQT2JHSGp0U0xTT0tjbjRxcUl1VnAxcmZzWk5vNEVGaGNr?=
 =?utf-8?B?cFpwenRjTWdlWmlWb0ROTi94TTFDVjcrQUdoN3JOMXAxYStFbkNJREkzTzBn?=
 =?utf-8?B?UGJaYTN4L2wrZWZuaFkyc1BGZWZ1eHh6RGdDNXNVNnV1YXpIeTArWmlVYnd0?=
 =?utf-8?B?UTluWnNrbWpiSU5wQS8wV3hsQi9oUkcxNS96bDJvZHdHRHduVEpuNDRVSHpy?=
 =?utf-8?B?MFhPSmV1MmU3Yjhhb3RmaVlaOGlKWXZLWW9JTFhNalUwQzZpcFdTMGM3KytM?=
 =?utf-8?B?clkzdmptUjByby91M1BQQXI4bHk4ejM5bVNSclVucGlaVUVDUkQ5ZzJpUlhw?=
 =?utf-8?B?NldHclBhUUJOazNTeWFSZTJURDNLVHk2M0tURnpoeUhuUUUrUHBIWExqR1J3?=
 =?utf-8?B?QmlGcU5UYlhGVjMzWit0d0JtRHpuTkNhcTB1YnhHT2tMNVEveU5WQ1JPbjlL?=
 =?utf-8?B?VUNPUk1EYjNuKzZMeHBUMERpMnpGWTNsUnZKci81cUpUblNTclp1ZXVPaVlm?=
 =?utf-8?B?QVprV29yQVpsdE95TmxyMW5FQXc5NEJwQjZnMWtWdkhORWpiZW9JRUYxbm9j?=
 =?utf-8?B?YmZSYTNPcFMraldBbkFnWnF6VlJvNE01SWliME1sWVE2VExhMmg1eTRhQUph?=
 =?utf-8?B?NnVDa1FMUmJoenlyaUh4WlpmdXQ1TVJyeGpXUUgxeHEzUmN4RTBlMURZMzIw?=
 =?utf-8?B?bWFlaFRtWUpNTElCR2VTbnRmYmJqWFA3ZHBzemUxeUw1bmxaVHhlWVVFYk15?=
 =?utf-8?B?dVVWSTZKZTJDaWJKYUZLL3gwaG1DQ3FyM3VrTHppa2NYd3habWRad1psL0NJ?=
 =?utf-8?B?aWRyYTJRQWNuL0dxT29oaXJDZEZFRXV3T1dNRkxmYVJaN2srSlF4K05JVDd4?=
 =?utf-8?B?UitWMDZNOVVvNzMrcjlreXVQaXVod1V1bWNHeUNUeUkzeHVnWjI3ekdlOWRH?=
 =?utf-8?B?Mk1xb2N3VmhhVlZrTVV6RUFBaTFqdDYybmxFY0FaYjVNaU5QdTlFNWFpdDVs?=
 =?utf-8?B?Wm03RTRrNGtoQTFMaGlGMjNrUjJpdi8xcDI3cWx5dXhjaUIxc2hzcnFyZ3Iw?=
 =?utf-8?B?SWM3Y1FSRm1ROWhoa0hIWGxYMG5nODhYOVUwZ0FGNERrZEc3L2VKdVl6dFdh?=
 =?utf-8?B?Q0lOUVFVRkFCWjJBV2dmVU1YUXQwQTc0NmxVTEhUUHRpSjlKSnlEZjJrSUpR?=
 =?utf-8?B?VVBlY3FMSVRQWVJ5VGdUQmk4dEZsT3o2RUx6MnBsbHpSaG1pczMwSyt1OHov?=
 =?utf-8?B?Smg3VmJGQlp4WTJPdzF1YjhFeGg5VlJ0S0xuUFVGN2FJSmsyKzRIOEJMZFRT?=
 =?utf-8?B?eVRnOEc5V3djTW8rY2lGZ0djOWI2YzdSeVlnNHVuYmxwMmozTjVlRlpMdnpS?=
 =?utf-8?B?VEx1NlBtUTJZd080dUxqbGlJdkZ4RmRzUi9pN0hiV1AxTHk5R1hOQUVyazY2?=
 =?utf-8?B?MGU0MG8xRGVnWFY4blcrQ2ZDS1VMNjEwWU9zWUVjSmRoWXc3YlM4SnhLK1Ez?=
 =?utf-8?B?T2NGZkhzaGROcUZLQVBCbFFOcTdLdXA3dHhFRTRhTzVFM001RE9MQ0N4a1R4?=
 =?utf-8?B?U1NIa1plRjJXSEFnWm5EeS9zTERZMVhIbXFmelk2VlMyTnFZTElOTmhjSElk?=
 =?utf-8?B?a0R2dlp4M1YyV3dxNHV5VTFaYVVGTi9GSjVjNFJDNWdTb01yUG81akxqVnA5?=
 =?utf-8?B?OGM2b0VVeitJZTk5TGVZbFJ4dkhSQ0V1V0VZUXJKYWFNNytENGQ0dml1dkhD?=
 =?utf-8?B?MmZSdlFSeUFaNHZGaGNVTGl2TVlXNEp5OEh6ZUxBUWs1VEpORk94K2JYeVp5?=
 =?utf-8?B?K3NaUlRRVVZqc2VFbGxLdnMyQXpESVZQR1hGQm1nQ0dFckxTelJ4OTV2M1hz?=
 =?utf-8?B?czg3TlFOdmFXZlQzM1NjaGU4VlVYVFU2eTVVQ280dWUxV0dtcDRMRURCcWZw?=
 =?utf-8?B?Z2VKaForQ2pHd0RFQTNQOXMrYXppczNqVUlBQXdXZ1cwU092bmYxSzAyKzFi?=
 =?utf-8?B?ZjZQVzhpWnRvcXQyRkNTZG1JOG11cmNBNUZoL1VpZkRCNUNibGdIakFhVTky?=
 =?utf-8?B?VHU3Ykh2Mlg0WjRURE81NGdTSlBoQk1hM0hEdzQ2endoYUFvejg1YVhTbENV?=
 =?utf-8?B?dXpGYnNlWDM5K1RkWDl5WHJHa3hQV3NxK3FEa0kvNzY4aXovVzhmMzBGejRz?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f300ce19-eb35-446c-6e59-08dd19063c4c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 10:34:32.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mk3n8PTBWP92tWHzXexksVurka9j49fijCMgMxMqF03X6A8Y9pQyL+oUfN4curNVoRn0X+JmaTxusFqwOI/CvULgGgL3y4DlLmchmzM/AOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8161
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 10:34:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5919

Hi Antonin,

On 12/10/24 10:33 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Mon Dec 9, 2024 at 6:28 PM CET, Quentin Schulz wrote:
> [...]
>>>>> +FEDORA_HOST_PACKAGES_DOC_PDF: >-
>>>>> +  latexmk
>>>>> +  texlive-collection-fontsextra
>>>>> +  texlive-collection-fontsrecommended
>>>>> +  texlive-collection-lang*
>>>>
>>>> Please use single quotes to surround texlive-collection-lang* otherwise
>>>> it may be interpreted by the shell, c.f. for me:
>>>>
>>>> ```sh
>>>> $ sudo dnf install texlive-collection-lang*
>>>> zsh: no matches found: libgpiod*
>>>> ```
>>>>
>>>> while `sudo dnf install 'texlive-collection-lang*'` works just fine.
>>>>
>>>> Ditto for the other occurrences later in this diff.
>>>
>>> So I had issues with this in the container scripts, which is why I left it at
>>> that. I initially single quoted this but it didn't work. Are you sure you can
>>
>> Can you tell us more about those issues with some error value/messages
>> or something?
>>
>>> mix non-quotes and quoted strings here? I'll give a try, might be specific to
>>> the dockerfile.
>>>
>>
>> """
>> $ sudo dnf install 'texlive-collection-lang*' latexmk
>> Updating and loading repositories:
>> Repositories loaded.
>> Package "texlive-collection-langarabic-11:svn59594-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langchinese-11:svn63995-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langcjk-11:svn65824-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langcyrillic-11:svn54074-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langczechslovak-11:svn54074-73.fc41.noarch"
>> is already installed.
>> Package "texlive-collection-langenglish-11:svn65496-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langeuropean-11:svn66432-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langfrench-11:svn63147-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langgerman-11:svn55706-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langgreek-11:svn65038-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langitalian-11:svn55129-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langjapanese-11:svn64603-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langkorean-11:svn54074-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langother-11:svn59564-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langpolish-11:svn54074-73.fc41.noarch" is
>> already installed.
>> Package "texlive-collection-langportuguese-11:svn54074-73.fc41.noarch"
>> is already installed.
>> Package "texlive-collection-langspanish-11:svn54141-73.fc41.noarch" is
>> already installed.
>> Package "latexmk-4.85-2.fc41.noarch" is already installed.
>>
>> Nothing to do.
>> """
>>
>> Same for latexmk first in the list.
>>
>> That's for DNF5 (fedora 41 and later).
>>
>> DNF4 seems to be happy in a fedora 40 container as well:
>>
>> """
>> [root@6f0bdf8b38f2 /]# dnf install latexmk 'texlive-collection-lang*'
>> Last metadata expiration check: 0:00:54 ago on Mon Dec  9 17:13:01 2024.
>> Dependencies resolved.
>> ==============================================================================================
>>    Package                                 Arch   Version
>>           Repo     Size
>> ==============================================================================================
>> Installing:
>>    latexmk                                 noarch 4.85-1.fc40
>>           updates 454 k
>>    texlive-collection-langarabic           noarch 11:svn59594-71.fc40
>>           fedora  9.7 k
>>    texlive-collection-langchinese          noarch 11:svn63995-71.fc40
>>           fedora   10 k
>>    texlive-collection-langcjk              noarch 11:svn65824-71.fc40
>>           fedora  9.8 k
>>    texlive-collection-langcyrillic         noarch 11:svn54074-71.fc40
>>           fedora   10 k
>>    texlive-collection-langczechslovak      noarch 11:svn54074-71.fc40
>>           fedora  9.4 k
>>    texlive-collection-langenglish          noarch 11:svn65496-71.fc40
>>           fedora   11 k
>>    texlive-collection-langeuropean         noarch 11:svn66432-71.fc40
>>           fedora   11 k
>>    texlive-collection-langfrench           noarch 11:svn63147-71.fc40
>>           fedora   10 k
>>    texlive-collection-langgerman           noarch 11:svn55706-71.fc40
>>           fedora   10 k
>>    texlive-collection-langgreek            noarch 11:svn65038-71.fc40
>>           fedora  9.6 k
>>    texlive-collection-langitalian          noarch 11:svn55129-71.fc40
>>           fedora  9.6 k
>>    texlive-collection-langjapanese         noarch 11:svn64603-71.fc40
>>           fedora   11 k
>>    texlive-collection-langkorean           noarch 11:svn54074-71.fc40
>>           fedora  9.4 k
>>    texlive-collection-langother            noarch 11:svn59564-71.fc40
>>           fedora   11 k
>>    texlive-collection-langpolish           noarch 11:svn54074-71.fc40
>>           fedora  9.5 k
>>    texlive-collection-langportuguese       noarch 11:svn54074-71.fc40
>>           fedora  9.4 k
>>    texlive-collection-langspanish          noarch 11:svn54141-71.fc40
>>           fedora  9.4 k
>> [...]
>> """
>>
>> and the other way around:
>>
>> """
>> [root@6f0bdf8b38f2 /]# dnf install 'texlive-collection-lang*' latexmk
>> Last metadata expiration check: 0:00:09 ago on Mon Dec  9 17:13:01 2024.
>> Dependencies resolved.
>> ==============================================================================================
>>    Package                                 Arch   Version
>>           Repo     Size
>> ==============================================================================================
>> Installing:
>>    latexmk                                 noarch 4.85-1.fc40
>>           updates 454 k
>>    texlive-collection-langarabic           noarch 11:svn59594-71.fc40
>>           fedora  9.7 k
>>    texlive-collection-langchinese          noarch 11:svn63995-71.fc40
>>           fedora   10 k
>>    texlive-collection-langcjk              noarch 11:svn65824-71.fc40
>>           fedora  9.8 k
>>    texlive-collection-langcyrillic         noarch 11:svn54074-71.fc40
>>           fedora   10 k
>>    texlive-collection-langczechslovak      noarch 11:svn54074-71.fc40
>>           fedora  9.4 k
>>    texlive-collection-langenglish          noarch 11:svn65496-71.fc40
>>           fedora   11 k
>>    texlive-collection-langeuropean         noarch 11:svn66432-71.fc40
>>           fedora   11 k
>>    texlive-collection-langfrench           noarch 11:svn63147-71.fc40
>>           fedora   10 k
>>    texlive-collection-langgerman           noarch 11:svn55706-71.fc40
>>           fedora   10 k
>>    texlive-collection-langgreek            noarch 11:svn65038-71.fc40
>>           fedora  9.6 k
>>    texlive-collection-langitalian          noarch 11:svn55129-71.fc40
>>           fedora  9.6 k
>>    texlive-collection-langjapanese         noarch 11:svn64603-71.fc40
>>           fedora   11 k
>>    texlive-collection-langkorean           noarch 11:svn54074-71.fc40
>>           fedora  9.4 k
>>    texlive-collection-langother            noarch 11:svn59564-71.fc40
>>           fedora   11 k
>>    texlive-collection-langpolish           noarch 11:svn54074-71.fc40
>>           fedora  9.5 k
>>    texlive-collection-langportuguese       noarch 11:svn54074-71.fc40
>>           fedora  9.4 k
>>    texlive-collection-langspanish          noarch 11:svn54141-71.fc40
>>           fedora  9.4 k
>> [...]
>> """
>>
>> Cheers,
>> Quentin
> 
> Thanks for taking the time to test this. I guess this works for most shells, but
> in the context of a Dockerfile I hit this error:
> 
>    10.39 No match for argument: 'texlive-collection-lang*'
>    10.45 Error: Unable to find a match: 'texlive-collection-lang*'
> 
> You can reproduce this by running:
> 
>    $ echo "'texlive-collection-lang*'" > /tmp/deps
>    $ sudo dnf install $(cat /tmp/deps)
> 

OK. I guess this is because shell isn't parsing the line and just 
interpreting it directly, so it's passing 'texlive-collection-lang*' to 
dnf, whereas before it would pass texlive-collection-lang* because shell 
would parse and unquote the argument?

> I was able use this instead:
> 
>    xargs -a /tmp/deps sudo dnf install
> 
> I'll use this instead in Fedora and others. xargs is installed by default in
> base Ubuntu/Debian/Fedora containers.
> 

I still think storing the full instructions in separate scripts is a 
more maintainable and future-proof solution than this.

Cheers,
Quentin

