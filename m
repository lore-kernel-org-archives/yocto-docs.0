Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F4AE77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 10:13:34 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.35])
 by mx.groups.io with SMTP id smtpd.web11.41578.1736849608732323054
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 02:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=hSzC0XYK;
 spf=pass (domain: cherry.de, ip: 40.107.159.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgTrjGycljJh4iCOE2d+om25l4hUsPIsG+5hXWM/UYVbZY0dFy1uNUIKa9uY4yRb9K1xnDhv5Pzkl8w8etEzAS7jXezOf8uEyGeFRWxnKO/4G4Hg3PR6PqygJuiIRJ9RI2B62eqjWgvRRWy6bNxBOORJg4kiF/3vOetNU51ngbH7UwptxiUCRs8Zi/Hn4Sz1v4qGAFmSfqUDthSk0L7xw0JqfashA4YzYIw6dCKog27D7s++Wlks8Ley76QUAnDs39G4O2ydhSgRQwlTgdjlAGYoAHAgVKNNjzPxzdXfDRutcFH13EhTgYN+APfxNoajD9UuUpYf2GnuvYXjds/Neg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpZ/afUKqnqwzyxT4p8iJZEgpxjfsR9PExP7bQigbiE=;
 b=iupcwjV+X6bgT8eEsFjQz6dRyBZetkrxg+3iB+k9Lxy6DjW93vtg9etqJA5P0N579ccgLKeVa+FrkX0e2fspO+i9oK4uTafLuHQnM1zbDts+OhrLTPZhPg3pR/+DQ/zyLa6vX/ig89qFeEUPpaXgzZT2hqoson763iPRJ7YWcnVxL89woKiwVIty2/n725aD9b5GHATxIRIkkNXRz/Got+tH9LeNHz4Xeod0hMA+5+onqA3XT9cKLye4rkFFZSjiAXyO7RwLvNmEEhYONApBctg4bIoxiQ3upr6+LqBGh8JNxT4NtVshq9axwHImQZ01wRXhPsmafQYNTY64Q2VFrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpZ/afUKqnqwzyxT4p8iJZEgpxjfsR9PExP7bQigbiE=;
 b=hSzC0XYKDcwW81/29gtTy51qWy3Qnhum4awAaP4dWVEMMVkFTN0Y0Zqs6l4BBmru9Vy6/xB0kpvrsPxXYcdBlSkBvZcvuQ2Pd8Hu391USwDemrC12RL0lMdLSUv1xxltRaxSN8Y+vUPoEka/guNJKPoPNhIyWEUJ7qiRxIMUJUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 10:13:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 10:13:25 +0000
Message-ID: <7ccefc90-b4c1-462c-a542-1b56e1a82580@cherry.de>
Date: Tue, 14 Jan 2025 11:13:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] Update autobuilder URLs to valkyrie
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 mhalstead@linuxfoundation.org, antonin.godard@bootlin.com
CC: docs@lists.yoctoproject.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241227-update-autobuilder-link-v1-1-6c1ec14a32fd@bootlin.com>
 <CADfgfobhK_b+kyi2QDFbMR1=CkKziGTFdMCX1SGxkJ7VmR+i_A@mail.gmail.com>
 <3fee6045-ef55-42ac-9dfd-e3b6a07e02de@cherry.de>
 <76df28efd27f93840ce4e7a8c9e8f8af8acf8c72.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <76df28efd27f93840ce4e7a8c9e8f8af8acf8c72.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8de12b-d1d0-4f5e-b2a9-08dd34841526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i4/zITWkExUbhsXOzCep3kQlBLlqZK+au4Xzx8H1wDHGNL2N+5f/mtknXcEW?=
 =?us-ascii?Q?UXwh/Iq+esXd31XdhbmOLlhsKmYpukNtxuq6JmhaY2GaLDucVRvn3tmn63nw?=
 =?us-ascii?Q?k0ur11XnK4oPLRU9zFrxtTfamH8ZsY06EOIWMw/ntcBxv3NHdvN46EzrXj0x?=
 =?us-ascii?Q?ydYkPJ3hOpVIoTqon94XmZffa8ojPd5KFWxQaajcQzggxFPwfOQkByw4L7gl?=
 =?us-ascii?Q?Ckys0aLkmBHBcKLbZoqv26ds7k5js2cCx0B9Yl5cXbsmc3U9EqXaVrzQjTwx?=
 =?us-ascii?Q?ZkpTaQdzoQjUhDqW9GN+IxXqoU3x0sZERgX2ghafFnOTvYJyGVcKq4aaLz5Q?=
 =?us-ascii?Q?hgjNzxSokb6WoaX5RK/v4jQNSPC43g6LLEgYbVKNlZMJ1VMYwaMqgw6YKyWW?=
 =?us-ascii?Q?JIWSGYx6Ed3mdF+0+L6sLAmBNAzbo+3CQxHqIuXhUw6FmQRQ4eDtNcsieZgI?=
 =?us-ascii?Q?RPAY4LeF1KoLPmv0hSLoSIXOb7F91jGcOs0UII1G2bENWQcekfSxNOuNaoAf?=
 =?us-ascii?Q?MOATbQ0VhMDuTGluExAhN87sb4qngL5Y4t2DnRGZb23uHgfz1ZQw5N5wKLGb?=
 =?us-ascii?Q?P2N4zT7j96aFOK67Br+Q8LS9gJjunQn3+7stdllDmg4gmLZWbEh1Nq6ldLo7?=
 =?us-ascii?Q?UvMHv/+/Jk5aAEJcE/3MO8Bi9ydsUrELuqLBBxR1BI30zKTPOhJtH3h6Godd?=
 =?us-ascii?Q?pVsRmjqDXnSJ3CDf1H8plWG+wlwr74VznsGpoL+e/9OdD+AF7ySautaUc2F8?=
 =?us-ascii?Q?Kwx4ulTLY1teLzPMQu6S+pASURNAAIuemSUPotd2bRhPEG6ulHPQ8fTOImro?=
 =?us-ascii?Q?i53M34rixva6Af6RlsTbP3ZZGFdJpEoDXR6OTNGvx7UN3mHWCliATiXXy7Hq?=
 =?us-ascii?Q?eYsEZBKHtiJjXL9gZ9PnumYyZzs7Si6Gg6W/V2HaxU6RTvlp+ZU2X1vrBEnj?=
 =?us-ascii?Q?EfEc13jvZcl8VjwoGpSesrlIBCZ26XHaZlS6lPX2AoAlDFApgO7I3HMEtOJH?=
 =?us-ascii?Q?qKFk3IHMbqI0HyZk2iAUXaCgcYLkJeb9YoWFowT0hEYQGSkD1LDag1s9rHyY?=
 =?us-ascii?Q?ymp/0ONsTUfnoQWhrpGjwwuOTHgRUfMHLAtVppn9Hc93prDc6K7GkEke3uX3?=
 =?us-ascii?Q?MmvY9ZHRbPulPv1iIXBSoluBm+Y0oq33XgnRG+bTPpYNnOSBmgMeeuS3dtqT?=
 =?us-ascii?Q?8kaDqiCkV0uKtuI5sE7wx1WjfUGp5kDoV9pPydiQEf7rEnVt7CbUG+uh4V/U?=
 =?us-ascii?Q?Xa2o17IssTURNG46QHRNggHfT99soEZEWJ4n0ArxFdkeadQwpcwHkVzw0HPQ?=
 =?us-ascii?Q?l4L2n2jI6GrERnNFw9hKsABlPAtvNuenh1pfxKDZ5VcIfA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MW+PvwruIA/bO2aQjefzAk7kI7mb7/CESBc+J3tex680rqaO3Qko9ctvjmoN?=
 =?us-ascii?Q?+qVzxIOyQMzmRuo2ASbSZhvjTdOF3b4e7xhuh6yPJIGwGddJi/uZLx8MdU0a?=
 =?us-ascii?Q?IzFXwX8+lUnptcBtFekkwOd4O4Ah4aFM7wN/Ab3YAWTPhNQdfY6YsYh/UQ/L?=
 =?us-ascii?Q?2y2LPzeZcjcUUby3vEqGjDcYdollg1uGY2m/vgio49DAzUX4RfJA7dnNvrwP?=
 =?us-ascii?Q?RDKZrBYLz0p+/wtjHmWYzZBe+NAMFfTKwSXvu5Fp8JATbAB+pZRfq5KS0MvH?=
 =?us-ascii?Q?Vs5071TCKeQiEfBUAB7NiJDlKVM/8GoQ1Gw4ww9CyRpcKsNvbxYvW6M26/6h?=
 =?us-ascii?Q?m4FhVA6eChjLig5dx9iVT9D4tyhoUxnYR/HL2QoigjQaz/wuM7oHMutChSID?=
 =?us-ascii?Q?LwbQKi6H2CoyJqmNzeSGm/fjIH9vaJcMUIZBMu4DvCh8ImhEEEI+SfQOkHQu?=
 =?us-ascii?Q?QGl4eMynOO5Ns45Ga5dWDYoYlJttddk3kQfl4OlCil1v6Km+KqUcCZQ57OOV?=
 =?us-ascii?Q?68cWZTMQbz05FMDUAmZhlHqoYmrfuzbmEn82If+Z1U5i77bDN/7Hdy+zT50m?=
 =?us-ascii?Q?wRFmT3XXCGUo9QS2+gv1rlclutIFt5AygofrjVDf0MEPMn148WhUANAW3xj5?=
 =?us-ascii?Q?liPZl4thRYXP6Tvy6vunbSf7Vzf2sUJQ9wJgHFTIU5qcxoIsawtWfaCyOp5K?=
 =?us-ascii?Q?+kE2k1CNsODK8JHZ7ibbUfi88c462bDwQtah5tb1P4yUHjhv0YiOnFad8HvL?=
 =?us-ascii?Q?OWIdk3VwL1L8Gf6dR+dd38ToN1z3XgT3WJravrKURv6L6DkQQlc+07pLVu1u?=
 =?us-ascii?Q?DKZgYffvXQogS82RW5pq6V2AB7XYSV66iHjMp12aveTFxa6YQt4ZogtQa6Uq?=
 =?us-ascii?Q?nrow7Vg8t/cQdDptou96Yp4QFIwvfBKUuRcZZuFiHAGMWGW6mzYFBu9LYXpZ?=
 =?us-ascii?Q?0ieV4GBoHb1Iidsfs/Up+opZRI1vBn32vx8pAYcbPMJLKTOIij94iudLnziq?=
 =?us-ascii?Q?3NMKsVftvnWTH88xXR0gjbXYfuniju1P4FRB2Z3/LDsSP1aQi56PO6JlXoPs?=
 =?us-ascii?Q?BIiyr6xY9W1LvSrjkYIc6TZST58i1fUrKQcYblJfRV4zb3+3Xu/PejS+pxY6?=
 =?us-ascii?Q?pJLiE0tUeN4/V7uxDc/mJGW9FDUAmjiNOknitv1Z6QmSZuASit9sW9ucFEF3?=
 =?us-ascii?Q?vwL+tWfuL7j7m5JdTF4LUenWvDThBnnPw6sk+q3XKma/A7kVc+ddBsWJtVdo?=
 =?us-ascii?Q?4C6o/hAr5K2+b3UxXkWPsRQ/xALSwnuIuO/5XNqeJ2AzEABPkMSl9JmBVMSg?=
 =?us-ascii?Q?I3/7RnuOvQM+npmJXFYtUY6pgpAegmlWS1axu6blocAapN3UUlcf3JFYy/q6?=
 =?us-ascii?Q?7thEUEz/g+5V4CuDnABk4sQAcYKnpRrGAbvMkznfryokOROVhF8muipO3Ter?=
 =?us-ascii?Q?WvqE4UhBagED89FS7bfhKx5/zvzoNN4RxT8RpKgYFTqiz8jnrHa9YNiNPclK?=
 =?us-ascii?Q?1Ru41mmUTlePxbtKfzkUTh7oeduOjEugJlAZpJTsZDaQc1u2hFLjHvftxcDy?=
 =?us-ascii?Q?rcLj22JAwcIh984MspNQ4CNZNiXqXbnwElvYJ4MqnuGsR41rILXr8Dy49052?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8de12b-d1d0-4f5e-b2a9-08dd34841526
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:13:25.2772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6WGkD9BhI8+MvmwZ4g8GVw2xqI1TxU6XPH3Xmp2LJTlfqFsdKASZlAno10syBe3xg0oIdFbrodidCX/+xrdACxZODMo/FtbkiZKVaHfj0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 10:13:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6102

Hi Richard, Antonin,

On 1/13/25 11:09 PM, Richard Purdie wrote:
> On Mon, 2025-01-13 at 18:05 +0100, Quentin Schulz via lists.yoctoproject.=
org wrote:
>>>> --=C2=A0 CentOS: :yocto_ab:`/typhoon/#/builders/reproducible-centos`
>>>> --=C2=A0 Debian: :yocto_ab:`/typhoon/#/builders/reproducible-debian`
>>>> --=C2=A0 Fedora: :yocto_ab:`/typhoon/#/builders/reproducible-fedora`
>>>> --=C2=A0 Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducible-ubuntu`
>>>> +-=C2=A0 CentOS: :yocto_ab:`/#/builders/reproducible-centos`
>>>> +-=C2=A0 Debian: :yocto_ab:`/#/builders/reproducible-debian`
>>>> +-=C2=A0 Fedora: :yocto_ab:`/#/builders/reproducible-fedora`
>>>> +-=C2=A0 Ubuntu: :yocto_ab:`/#/builders/reproducible-ubuntu`
>>>>
>>
>> Am I supposed to see anything at
>> https://valkyrie.yoctoproject.org/#/builders/reproducible-debian? I only
>> have None in all Build requests, Build times, Success Rate... Same for
>> all other builders.
>=20
> Initially when we implemented reproducible builds, we ran then on
> multiple distros explicitly. Over time the errors subsided and we
> eventually decided it was good enough to test this on a distro at
> random. We therefore just do that now and no longer use the distro
> specific targets. They were left around just in case we needed them.
> You therefore want the plain "reproducible" target rather than the
> distro specific ones.
>=20

Thanks for the info, we need to update the docs to reflect that change=20
then, otherwise it looks like we're not doing reproducible builds at all=20
anymore :)

Cheers,
Quentin

