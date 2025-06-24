Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56466C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:44:57 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.35])
 by mx.groups.io with SMTP id smtpd.web10.4535.1750758291498386006
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Qaento0N;
 spf=pass (domain: cherry.de, ip: 40.107.162.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3Tr50fGPK4egmkIay9HEYcybSoUT4EbKykZj3kHY/lyPS13a3xSfPIL4YubiD3ntpHYzkXjLUBNTlXRB/eUNGDjI6frH1FWh4TL6WXrC4WNWY3Nw5/czu8+CFlTkCVQheSCYPB/BFntvCRFH4KnjcHbZe9FQktwwdieObfzjY2gJ9BvXb8NKrhzermUpoWMJWQZbIWULHAu+lb8/iyy1lJrr+NIxgiADrAgOeAer6/BbOerUacffk2aCXtH3ETqljEtjRxXDRsG4tnOdsyD+bVIOSjdT20VqtBB2dhMHWIvGwBiXjWvB52dGeD++WkuoIFnqNcOGzKp95OtolIqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLtm6Q9BYU3tBBq+xzZWFI1neWOTvKo+tZIheqaqkbA=;
 b=Gl96kkp+kXvqFltdnHuHn5Ohi5bhS+p7gk/B3QS21c3to/lERyxa09k6lt0OgYn2GL3LpiZdV4zSQlzLDt3laT+oWjg56heJSbP8D2CR0oWaQ8WG+DJud7c6lu3Mq4WlTDHl/sKYtYBS4LhrmYSe4oEcOyEsS9/FqXY0VsUek+3ghDgn77MUNeV4h+b/km3uOR5+Cy1slZcWOnOm2BIZDBszC1oGOW7bJuNqWtcmwAlt+VOl25Bla1ioRof1lUbSNMRUN1JXcqVZlrEFWk1amFE4RJFbsZ9KgT5AEoQDaVXCme4EKci9uH7aL2FyQggSf6WpXt+cRV+ejjaPWxaibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLtm6Q9BYU3tBBq+xzZWFI1neWOTvKo+tZIheqaqkbA=;
 b=Qaento0NIVsIbbYNfL7q/gDmT+sx2BTWYPmSwvTV5RceYLct/nz62/1FuHo2CofDTBb+r7/pXRYXHnh7SgVqJjGVE9q+IgAuD55bFg2WsSbufhB5Sb6sWHTATFpspN0t4AMkE75UpJ9LLhhkV9AkwSUSHG3DFs1hI0DenhGLExw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10351.eurprd04.prod.outlook.com (2603:10a6:150:1c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Tue, 24 Jun
 2025 09:44:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:44:39 +0000
Message-ID: <1b9b3133-953a-414d-890f-bd10b9bed747@cherry.de>
Date: Tue, 24 Jun 2025 11:44:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: show bin_package example
 wireless-regdb recipe
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <0639bb4b-2e1c-2dde-098d-ac99d62bb646@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <0639bb4b-2e1c-2dde-098d-ac99d62bb646@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: c11582c0-6ea6-4eb7-9cd8-08ddb303bd07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?czc3Mms2WXdyZGcwUkpoTFQ3TE4yOWtueklHcThJOTdvajBNS1ZzMGRGc0hX?=
 =?utf-8?B?a0dBZUVHUzVnZFdtR3JjZUZUNnFNM0RRZUxzQkJwUWR2bHB3aW5mckkwV05G?=
 =?utf-8?B?YUltSytvaE92dUhEVGYxdkxxaXArTXo4VEE5Q2hvTUpTbHkzR2FubEFwYTA4?=
 =?utf-8?B?bUozMUo2ckRidW53dXVrTGVoeE54R2FOZkUwSmpKcnVSTzI3aG5ncGZMQWto?=
 =?utf-8?B?N0FoQjc1NjlqUm5PUWFvZ0IxTTNMRzB3RWthZmYxYldGWWFUTEF1S005cFBU?=
 =?utf-8?B?U050enByOHZ0N2hubDBqZnJDVTM1bDFFSzg3Q3B4ckZBMlU5a2JCVUhCZUtt?=
 =?utf-8?B?VVp6emlHYWoxc2V0V1VFdE5MWGxLUlV4QjFvNk4rMEhyVEVJR2lISW52YlZp?=
 =?utf-8?B?VzhGUEtrckt3NnYzNjZ6MFlKTVpIQlpDODhYcEpEOEhxUEp5RzVUVEU3RXF2?=
 =?utf-8?B?NUNJY0NHNjkwc2NkY3VkMGdSUXdLV1crK3I0TTVLVVBEM2Z5NWJXK3FGRlRs?=
 =?utf-8?B?TUZUUE5teVdIcnNlWjlkR0JmQUhCaXVWRVhlMzZIdmNUV1BvQWJkbHVmVVVJ?=
 =?utf-8?B?MXJrM1MvWnFSZzJhc0VwRjBCUGp1SlE5ZlUrWXpQL3FPL0JBd0hpZkxzQWxV?=
 =?utf-8?B?WnZ1eklhdjhNdUZwRFRxdXJMdnBweG1XbFNPeVpXUGV4WXpzN1N5L09Handz?=
 =?utf-8?B?b0Y1MW0xOTZIWm4yOXlSWkM0eWoweDFodVhqbUg5VXFnVUY0RUZEM21tNGNJ?=
 =?utf-8?B?V1NaZ3IrWVF6QUJzWXFmVnFTcFZYR1ArNm9vaXdoTjZmNFM5L2NxL0NlVTUy?=
 =?utf-8?B?bDBBbjFsZGdnVnAzcy9oWkVPZ0xoSnYrS3ZqdldMUGEyOUtMY1hPcjdVQWl1?=
 =?utf-8?B?YnkwbnhKSjIzOThZbGI4a0swYllqMVJJSEFBQXQwSXR2ZmVNbmlKR2NrY1hZ?=
 =?utf-8?B?UjRLWWwyZTVnSVNFUmFFbDB2ZDhkS3J3RjZ1Qk1kYXBwSXJZU29RQ3hGckJl?=
 =?utf-8?B?a09lODdyWThYajcvMS9lZE8wcUNGSDRkU2Z2KzNjOGRoa2Y0ZmxWSWhsSWdm?=
 =?utf-8?B?Vm93RlNJOXV0M0Y2Y0tOemp0dGkvMlphNlVBdU5Da0RYK0hmUmF5dEs5WWhq?=
 =?utf-8?B?dnpUTjVpK2tQaUo4UUhvTmI4UDBJdzgrZTdLR0s4MnpIQUR6dVVrSkxmMGlj?=
 =?utf-8?B?WWYzZkdYM0FDRmJhTFF5WityeDFRYjlYaDR0UG5mbHRVd0VqK0I3dVZKTXdS?=
 =?utf-8?B?cFllY1BEOW9sZUpaUVI5NjYyd2V4Zmp5bE5NZ3dZWEFlQVc1ZlJ3RVFIUUhR?=
 =?utf-8?B?RzhWTVFoSmV3VTdVRWhETWwzUENoY250NDRmS0x1YnJWSEtpODVVdDdjcE9O?=
 =?utf-8?B?cnZYSjVZVDUwRU1VR3hXcGhOejZOVVd6d0tjcjBOckZudnZDcFRENFBDUXIv?=
 =?utf-8?B?ZVlER3MxR01yN0tsOSs2Ly8vSTBzWmtGSFNxUUc1dS85dUplaVBBUmNOdFZ0?=
 =?utf-8?B?NG54V0hNMnVKZG9RaGZrdm55OUYvcU4wcmE0K012aE5DT0hrSXpCa1RBTGdU?=
 =?utf-8?B?WDZrUkRLbnVndWdpbG5QbHZoUWx6OUhjQm5BMytyKzJUL0RxRnNEMkgvK0Mz?=
 =?utf-8?B?VVJaV3dmc3JBVS9ldEFJS2lTanBxM3V3NjgvanJtZGFzTHFPUm5BUTJueGtN?=
 =?utf-8?B?S3RNYllXamJCdEcvcGE4ME1DOGdmeFV4cjFoUS9GeVFnRGlGc1o0SXJ3OHZu?=
 =?utf-8?B?VzhHMTBBU0NQQjdVdmdlVjBEZzMrMHhqSFVjZUpERDh5WllKRTM0bjlTR2th?=
 =?utf-8?B?NnhNN2VmRTYxMWdPK1RMck9EMHRvUGVHTXdyak9oNzh4WHYvTmtBVnBNNzBq?=
 =?utf-8?B?WFFxT1hzZWhudXJyOU1FTDN5ZDNSVU9kaEdMR3NIa0NLVXE2VUxyQ3crUkdj?=
 =?utf-8?Q?qatpy2NW1zs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YzI1QzliOFVsUnRnYk1jZDZMbEpFV1NrdHk0RUN4Mnp6V3hCVFNTVG9GRjNx?=
 =?utf-8?B?V2RXSmxrNWo3WUM2cWtBNnQxTTFxN3dwUzZvUjBYOHAxNFo1Q1NZYlo3RDI3?=
 =?utf-8?B?eHBwaGhJWEROYjViUFZlZ2VTYW9MRUsrc2NrOFJPT2t5c0ZkOElWT2xJazdC?=
 =?utf-8?B?MjdvWHc5aU01NkNMbGxvMG5ocXJhWXRNbDBYWlJwaWlySUFEb1pRNHVtZFpp?=
 =?utf-8?B?cVVsV1QxMk1kMmp0d3N4N0NlMVFYQjEwTnVlS005aG5wbjJpYWlaS3VyTk9G?=
 =?utf-8?B?WU5NcGRvWDl3UU5ZMnZKTktOVDI3RDJTcHYraUh6ZW9waUI2UU5FQkwycVIx?=
 =?utf-8?B?bkhLUTFkMHFJMmp0Uk5nZ0E5cUZSZHFTZFdYRUhMSFA5WFduSFo0V21Kd1VJ?=
 =?utf-8?B?Q3VIZzZDRUUvRElIV2lNVmVGUXl5T1R5MndJejJtM0JjMXNUcTdFbnhuOVN1?=
 =?utf-8?B?aHNGcnA0VFVLVU1pRklIMnFoWjlnU055TG16ZEVVdW1NVDY4ZzZyU0VCVDMr?=
 =?utf-8?B?Z3gxYW1wQkd0OStvRFRrQkhOdUluZGdsY0lRN0JEeHNBS09va1crNUp4VitU?=
 =?utf-8?B?QmZabHROOTRhMkRLSE1oUmMyeTM0dHBuT3BDak83UTZVTkpEQjJJL2dOZEpx?=
 =?utf-8?B?VUZlTWZuV1EybnpCK1FaWGNHSzNsNDhlU21aa3Jyb0FMczUzZlJrVU00STlr?=
 =?utf-8?B?amNjWmF3R3ZSYVhMZE5LcWp5VmxRUURja0l6OUlIb1UwNmJqTHV6ekhMNWVz?=
 =?utf-8?B?M0RGZmx1cEdTK0ZZRUVmWEw5NDBPSis0K3NmTXdCQmRrdWdsOTNhRk44bmVp?=
 =?utf-8?B?eTNMZHhpait0YXJweGxObFJqTWtKYVNBM0dNUitrZ2tWZ2Y5ZGpibUJzd1JE?=
 =?utf-8?B?MlN2UGdOQzA0Y1Z1TURnYU8xUTYyajFnbTJXN01vcGZiNktjUWVSby9FVkNK?=
 =?utf-8?B?NGxRSWlVNjJIZFhoQ21tOWNYRUM1TFNGOFcwSXhEVXU5MzBiZTRsZWZGbklj?=
 =?utf-8?B?UVFpQnNYOGhjZTQ4ZW9iU3Y0bnFZSGdIekV5ZStWMWNuMDA2NEJCQzFpb3Fn?=
 =?utf-8?B?S0t4eEFvbXBvaHh0bStPd0IzVkswaFkxVWo0QWZrZ25tbzZrSTNscGVkT1lM?=
 =?utf-8?B?c3Q4RS9FbU1lNnZwSUZGYUNhbFQ4cnloVG0xblg1VTU3ZjdBcVRKM3NJZTND?=
 =?utf-8?B?T0NZMmJyeFRwS0dWWGJjdXNaU0xyMWh4MU5QV0RYanlZdldwM0pjQ2dSbmxy?=
 =?utf-8?B?QkY4T0JGU2F2R1JTcXVKL21RUXo5K3Bic3lKNkRkcmxCcjhUelVTdUJBaGsz?=
 =?utf-8?B?MW8ydS91L0lCYjEvNDNvam8vNEdmTWljZmJoWnNBamZUUmVLcDMvWjJMNTIy?=
 =?utf-8?B?aWQ5M0I1enhzb1RiV3NsSnFLVVVMMmhUWTNlRFV5dllpc1VsR2tHY283bklN?=
 =?utf-8?B?WlRBdCtXM09XYnhReERqZFJKNDluUU9wODZTbEROSVlwY2w0Wms1NUZLSHBO?=
 =?utf-8?B?L1JoZHpPY09Wc09sOHh0Q2l6NzRteURKUTdWMVR2b21FajlFd2JHQVRlZktI?=
 =?utf-8?B?QndldWd1UUpHNXpsRGZqVnlVZkhTYnJvMllBOGlhc2JDNTdubU43UUo1SzIv?=
 =?utf-8?B?UXhBWTZPczNPSjdkcTZBck05ZGd5L1FhR0dRKzZJak5FVzVEM2U2bVQwUG1T?=
 =?utf-8?B?elRqVU5ZbWord3BuRGJlVEs0dmJscExUOTBiWm1qYkhOMkZGWDhMbU80aHFn?=
 =?utf-8?B?MUtlRCtHMmUraFNyWUJ4OW0vMFV6STBjY3N2SkxqaWE4cWxlZURZR2ozV21B?=
 =?utf-8?B?ZzVFVTRRM3BtY2JBSUdaM3VPekJvWTl1eTJsTVJvditjblo5ekpYYit5aTFF?=
 =?utf-8?B?OENrQ1JSTU9kckwxbFg4bzNValQyOEladEdUOXdBbE5qWnVKTFZuTjRSaG80?=
 =?utf-8?B?TUdKQ0pNclJlREZ5Z0NzcnN4ZWpKbHZYQ3BSblphQUhDNU1jS09NcW5uTjAy?=
 =?utf-8?B?V09oSkIwbUttNXRhbzdCUzBLbEtJdXNVZmZHM0dsV2lsVkVWd0NMUTlHeHdB?=
 =?utf-8?B?TndDS09wTFFzU2ZPTWpPTm5hMmE5R0NCcnRhY0RZYVZMMS8xSTBJaWV3aHly?=
 =?utf-8?B?enRXSVBSZ2pKamZzZHdVOHlXVm94TGJDa2NOVXJ2ZXBDT0RqeisyMUxXcHhJ?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c11582c0-6ea6-4eb7-9cd8-08ddb303bd07
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:44:39.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aybyU+ICgD2uUX5uaFEoCGmeM3l4laNBb6InmcJ8BwUGOPnxq8fmN7m52nIOni47MLjHMswAPAoV3fqmVVztAlsR+iE9Y1bxmR05V1sox9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10351
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:44:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7201

Hi Robert,

On 6/23/25 7:40 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Add a snippet from the wireless-regdb recipe to demonstrate a simple
> example of a bin_package recipe.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

