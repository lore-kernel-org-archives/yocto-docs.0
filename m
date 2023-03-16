Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F161BC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 00:06:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1071.1678925196113415160
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Mar 2023 17:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hJn2+z1f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2439aa34d3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FNlpWc010681;
	Wed, 15 Mar 2023 17:06:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=xiTP5x6id9L/tDTMG8Ef7sIHwcZN+0bs+PaMFN+HHN8=;
 b=hJn2+z1fAHz0AusIXCFWJk3EWfQUeA/F2WQlvOtBtDtmxqaZeZegzA6oZLgZlK+ZjrXT
 hJ/aEqvr8FhHe75gXMenfZr6a9Eogqb7qAr5o4kaxj0N2Kj1Gjwu45l43uZTFflxTwRs
 EWqGf7L/S2dir2AQvif27Ay9xrmlZZJBu68P9hCT09EnapDRheV5o2mfaeYthR1ntTUS
 1qk6wD4ANNLrrgy7o0AEFTLmOFQTTB0f0nFAq1CrXnWFReqv1DKmqmW0UL0iAUwA3PFy
 wMKYS4ZW82rfyW2Q/XeLoB3IlHOj9hi8G7vg5jcwdhUNjyuAhGnn/UsKg9VEuTiDe8/M AQ== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqksg0xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 17:06:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwO1KViNCt5ThO1WxKpR/9Eh+ZgJ5lxkEe7iW2L9RET0r1BtkvcnPR1h4F73Ha8EnOJw2oHWdlXl8Lprz+WAJDfMYALO0+LrSnCo5+StXvrZyrd/43gyutQXjeI+37N19U93gwgkOM+pW+cMbOksSrtxi3vXZHAPTBRKoe3KfpgX1ZLUugXuUjSR+ml4fgq6SEbs+FjWiQCMSwiOe7yuz/2vSP8lRchYNtr/XF/gqj6AlOlEwfWOioSemXg2cVrzC6nLKZS9v9bbbYSyGc0LxNlU/lhRoFvpl/YRBpm6KIyfbqAfOPjLwmw+gKWa9Gv3iV6Iyp7o2/D2yGPc5chHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiTP5x6id9L/tDTMG8Ef7sIHwcZN+0bs+PaMFN+HHN8=;
 b=ZH3wW1cWCHKX8vl7nEJSVPGvk6UgbtHkeRZSDRr344/D7SQFotUf4GpOGTAW6IY1rRwdpXlV4Mnz0rHjylekEDU2vgJ3mZYgMyOcQarlY/IB8xnxAmWFQeTpu3/g57rpuFfm4rGQZ0BmfoqeJJhGj72WQ4QuAzU14QGz8DCnrIcICUN+61xZGkRY6Gk5V5hX5WByXKPk6zn4WOZ5Fku1bK8V1d08Zga3BiruVnqfE30KlFA+2qD3EWB/+UuOQspbx0c4ttdG5aqZ+iN7xomp3KYXcNqoZ/b9n4hq3UPXmc1hGXQgJDoqygfLVnyZKWPlFeDkGYrM/wzS8NmEazSMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 00:06:28 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 00:06:28 +0000
Content-Type: multipart/alternative;
 boundary="------------H0RZjD0ZDN6yRGSz3oeMeEIQ"
Message-ID: <53875ee2-363a-4238-a6c0-70acc14eaac1@windriver.com>
Date: Wed, 15 Mar 2023 20:06:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] poky.yaml.in, system-requirements.rst: update system
 requirements
Content-Language: en-CA
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20230315204247.443297-1-michael.opdenacker@bootlin.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230315204247.443297-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: YQBPR01CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::20)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c9bb2d-4a78-4188-acc2-08db25b24913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RWR3Xl4yAM9K2M1YaBVLSfeJraybUai3UR4h2LnkjKZcMysN7UiTEjNf05HeGhcQQ/5GMO4FCYEjVRKHn3Xb0i9CLPFAZ58+milomkKpkAmocsUOg/GB7thJ2cRIF6B6GbOtD1LVyfGCFcpknuFg0aoQRvdldyib0eZviHLlmHO9GA9czwht67bpUImlSIGGfnSGehu86uGXRPtkv87FMy5UteIofYMaw+igf3ZiT9lcRYxt/jwlHtrjAFydJVCSQS0UYIb0sJwffG26+B/5XPYF1ARPpD8F4mKAthK7A5DDzhYdZ+oUcV/7NiJuMGYLT7rxAeQzxgOC1/+Si5vCnp5QYnGkwducLWYpAqAQ6I6PDjqcO7cfdkwlMz51tlrsMFWQ/K3Lu3nqEHleZxVxEKxXqT213mIyY/XGcU80w5yDmQhn8MMClsPWYxS8mFoQS8n8SbjN0Ny+L1Z9Kujgtg1C6AapiKy/d8fFjMSFZXph3NspF5LJoG4bNPRwefjM5V6CPaMx8uUbEa1yAnyJ8V3Woo+aT6c3M8zAr0BPVS8XikKBROmqhzA1skw8IP3NjHJyuqcQlEkfVz2mEFF1AQBfguGYMHGmd00NTkO/Ubpbi7+1k9jxUob94nYrt1OumrSdpAWFncTSDLrmYO6ErqZmw2PwV2QV3y8MMIYdIENgpYJhW24S35H14ZYOgzihJ50jH0bF3BCGjrqlKTSL5u+s21Dv5KtnQ53BtAVyJss=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(451199018)(31686004)(8936002)(41300700001)(15650500001)(2906002)(38100700002)(86362001)(31696002)(36756003)(5660300002)(478600001)(8676002)(6666004)(6486002)(66476007)(66946007)(33964004)(66556008)(53546011)(26005)(316002)(186003)(83380400001)(6506007)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzhXSmdHYjNpZDdNQkFmYWYxa1ZpbUNaOXpwWVE0RDYyeHpvbEM0ZTJrRExM?=
 =?utf-8?B?c2UyMzNyb2V1Nm9lUEVFdkZlUjcwdjcvY0g4aFhzcm51RW9zOG5OakE2S3hK?=
 =?utf-8?B?MUY3VUEwSTNsN2Y4OTA1RVlpbDBQS0dlZDJrWHppYmx3V1N4Z2JkOUlWeFVr?=
 =?utf-8?B?bUFaaDBidytmSThZdVd1a0JoWEc4cG5BUzVJVktPZEp4N1hyU2ZzRXFxU0Y3?=
 =?utf-8?B?cS83WERZYitBbGVvY0w2WTU2dXFIa2xPTVR3dDgyTE9EWnExUU5SK0tjdHVi?=
 =?utf-8?B?UFdGNnhaMDR1WE1zVlFPUklEaW5RSFdTQzU2dENzaGhZaFBucnJKa2ZZK2lR?=
 =?utf-8?B?bHhvNGRNM1ZDWmJBdG5ua0gyd0R2UWNuUEhIU0l6YjdUTEZHVy9OR1B0QkZK?=
 =?utf-8?B?WncwL3p4bHZ4cm9veUk1b2FNbmhoTGNHc2N5TWFrY1ZNMGZ4bGovLzMzNXB6?=
 =?utf-8?B?LzBVZEdSNHJQekoxUWxpRkpjbE43RnlncUNPMnhuZzhsSU8rUEQ5WFJHaEoy?=
 =?utf-8?B?MTZXbEVyZERuRGFINHVCWXhoR3VJUnpyODBBbFhTaG53Y1hWQ0QzeTk1Tjcy?=
 =?utf-8?B?TWk0aFpOZG92SUlGS2NQVXI0L09rbFljWndyL2NZd1RsblN0TEhFanJDdnpk?=
 =?utf-8?B?cFZ1UnIxR280dkFEUWZZeXg4WCtyRVBWaUJFeVZId0FDMUo4REJBTzZidG9i?=
 =?utf-8?B?ZytSbWpQYllWN1FCV0k4eGVsNjh5d3JhZGMwQ2NlR0N1bFpUQko2VnIvUTlZ?=
 =?utf-8?B?aWxrbC81N0pNaEhBcGtlTXI5V1U3SWRGVW53Y1FYNGlHaFhPVnh0czJMRFlE?=
 =?utf-8?B?VFlVNDgwNXl2aXRqWjR5dy9uQ1E1dmpuWUdzWWpPdVJ2dlJ1ZkIvdmE0d0hC?=
 =?utf-8?B?MU1QVGdJaDFUR05hSHFqa05jQ1lFU25FdGdHZ1dsU0FFZlBIYW9pR2xGcmZG?=
 =?utf-8?B?dDdGdExqczhmYlFQWFBlVklXYU1DaVZ1Y1ZtT3U5ZVJEcGh3aHltQUQ5MTk3?=
 =?utf-8?B?SVJoUHovdFp3dzU3TTdTQnhrTklhbDBaUzhjNGxGRnpLckpJK01jRHdmR1J5?=
 =?utf-8?B?QTRENGpMZ29uZ1BKTHhoMHBLb3FibnNlYlVUSW5hYlcxd0EyczliVDd1TXFB?=
 =?utf-8?B?UitZcUdwR0pQZ3hVRGxaT2QyWExRNnJyL3VvNGEreS9WdkJDME5pS1lEWUF2?=
 =?utf-8?B?Z1l4c3o2YVd0Yi9FQ00ycnFPd1RZQ0c3ZWRTbHBHWXR4TmVjZXV6K3N3Smp3?=
 =?utf-8?B?TTJkNzZrUXZyZXUrZ2xSdURNWXJzUGFYazAzbUw4SS9HbG9kbWFLcXE4MCto?=
 =?utf-8?B?VGcwTXZPNnowdW1zd2habFRtckxrV1JkMG5adk9ZdmFNOWRzdHRyZ3NIOHk0?=
 =?utf-8?B?RlU2VjZoWEI1cThLazQzUFNnTEdHRkVsTnZESmM3Y0RTd0R6enRaTzRFYnB3?=
 =?utf-8?B?VFJOZkwzYkV1R0JyTTRpeDhJcUNobXplVXp0eWZuRE1VYzUwTlFSOTgrRWVZ?=
 =?utf-8?B?d3pUWHpoT1E1VmpTcFRLelkxYXlvMmxHdjBHZ2JtMU13U29OeGhZeFZMYmtj?=
 =?utf-8?B?UEdqYlRVemd1N0t1Tjl1cFU2ejBzbk81OURkazk5RDZONWxrQjVTb1lIMUdN?=
 =?utf-8?B?QlJaUWNsWk9JcmtyZjBwb1Z3VkxBYlZYbnFvU0dRWi9vSmR5RXNTVGpJVURO?=
 =?utf-8?B?S0htZXgyZnBHZy9pOHM0bk5aWGVMUm0wM21TemVlU1o0SWp1Q3RMUzdEZzNx?=
 =?utf-8?B?QUZJV05zWnZTenBLWlB2Q0pDQlRYaE84bHExNjhVaGYwYUdHUVd4QlY5UEg1?=
 =?utf-8?B?RHdyNVgrOEtXRnlKSWxYQUlQWUtkaFpKbkY3WDdWd2ZrWFFOTXFGSXBPNlA0?=
 =?utf-8?B?NDdFK1VXOWRZRXZFWXNrUGJSVCtKUEEvSFpMUktFSk5OcnJmdzAxenhFNm94?=
 =?utf-8?B?M0s3TS9WNGpSWHFEd1ZFeDFUcGpsaUxyL2EyMi9KZU1aR2hqU1F2cmMrTUFm?=
 =?utf-8?B?S08zbUNxSmozcy9tdncreWpuVDl0VU04MWNremV4RG5lZmw0dGFpSXlncjU3?=
 =?utf-8?B?S0xkb2FhUnFqUHppZWpkWE0zOHZsOWh5RGkxUExXMVRyWTdTTDNYdDg2Qm94?=
 =?utf-8?B?WUd4MFE0T1UveUl6QkdLZk5Ba3V3c3lpbytOVnBSdDVPSE9aZGxvWUZ0RkNX?=
 =?utf-8?Q?hdQWStcgdM1my6kJSZtZRKA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c9bb2d-4a78-4188-acc2-08db25b24913
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 00:06:28.2394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KPFES4b0AHb7K8MM6u5jUo1k7brgOJLH9JEAC7ZEtIfOgDjidFOrduVM6Twlw2Nlae+pL7oMR+DFXTHKi8awPcBLr6qcVlX+SnmLRcWyg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
X-Proofpoint-ORIG-GUID: jRsbIsKA6UxQoq9e4y835J51OaLrWl6U
X-Proofpoint-GUID: jRsbIsKA6UxQoq9e4y835J51OaLrWl6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303150197
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Mar 2023 00:06:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3799

--------------H0RZjD0ZDN6yRGSz3oeMeEIQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-03-15 16:42, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker<michael.opdenacker@bootlin.com>
>
> - Update system requirements after making tests on basic Docker
>    containers of:
>    - Ubuntu 22.04
>    - Fedora 37
>    - OpenSuse Leap 15.4
>    - AlmaLinux 9
>
> - Including the need to have the en_US.UTF-8 locale on the system.
>
> - Rename the CENTOS8_HOST_PACKAGES_ESSENTIAL macro to ALMALINUX_HOST_PACKAGES_ESSENTIAL
>    As for the other distros, stop refering to a specific version of AlmaLinux. We mention
>    the supported versions in the system-requirements.rst file anyway.
>
> - Remove the unused CENTOS7_HOST_PACKAGES_ESSENTIAL macro
>
> Signed-off-by: Michael Opdenacker<michael.opdenacker@bootlin.com>
> Reported-by: Randy MacLeod<randy.macleod@windriver.com>
> ---
>   documentation/poky.yaml.in                    | 21 +++++++------------
>   .../ref-manual/system-requirements.rst        | 10 ++++-----
>   2 files changed, 13 insertions(+), 18 deletions(-)


LGTM, thanks Michael!

../Randy

>
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index cdccf6f3ca..44654aa62f 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -13,33 +13,28 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
>   UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
>        build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
>        xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
> -     python3-subunit mesa-common-dev zstd liblz4-tool"
> +     python3-subunit mesa-common-dev zstd liblz4-tool file locales
> +     \n\      $ sudo locale-gen en_US.UTF-8"
>   FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>        python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
>        python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
> -     perl-File-Copy perl-locale zstd lz4"
> +     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en"
>   OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
>        diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
>        python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
> -     zstd lz4
> +     zstd lz4 bzip2 gzip hostname
>        \n\      $ sudo pip3 install GitPython"
> -CENTOS7_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> -     \n\      $ sudo yum makecache
> -     \n\      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
> -     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
> -     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip xz \
> -     which SDL-devel mesa-libGL-devel zstd lz4
> -     \n\      $ sudo pip3 install GitPython jinja2"
> -CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> -     \n\      $ sudo dnf config-manager --set-enabled PowerTools
> +ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> +     \n\      $ sudo yum install dnf-plugins-core
> +     \n\      $ sudo dnf config-manager --set-enabled crb
>        \n\      $ sudo dnf makecache
>        \n\      $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
>        socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
>        python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
> -     rpcgen mesa-libGL-devel zstd lz4"
> +     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en"
>   PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
>   MIN_PYTHON_VERSION : "3.8.0"
>   MIN_TAR_VERSION : "1.28"
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index 38d4aaf5a7..1bbe7b894d 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -168,16 +168,16 @@ supported openSUSE Linux distribution:
>         &PIP3_HOST_PACKAGES_DOC;
>   
>   
> -AlmaLinux-8 Packages
> ---------------------
> +AlmaLinux Packages
> +------------------
>   
>   Here are the required packages by function given a
> -supported AlmaLinux-8 Linux distribution:
> +supported AlmaLinux Linux distribution:
>   
>   -  *Essentials:* Packages needed to build an image for a headless
>      system::
>   
> -      $ sudo dnf install &CENTOS8_HOST_PACKAGES_ESSENTIAL;
> +      $ sudo dnf install &ALMALINUX8_HOST_PACKAGES_ESSENTIAL;
>   
>      .. note::
>   
> @@ -186,7 +186,7 @@ supported AlmaLinux-8 Linux distribution:
>            easy installation of packages not included in enterprise Linux
>            by default. You need to install these packages separately.
>   
> -      -  The ``PowerTools`` repo provides additional packages such as
> +      -  The ``PowerTools/CRB`` repo provides additional packages such as
>            ``rpcgen`` and ``texinfo``.
>   
>         -  The ``makecache`` command consumes additional Metadata from


-- 
# Randy MacLeod
# Wind River Linux

--------------H0RZjD0ZDN6yRGSz3oeMeEIQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-03-15 16:42,
      <a class="moz-txt-link-abbreviated" href="mailto:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230315204247.443297-1-michael.opdenacker@bootlin.com">
      <pre class="moz-quote-pre" wrap="">From: Michael Opdenacker <a class="moz-txt-link-rfc2396E" href="mailto:michael.opdenacker@bootlin.com">&lt;michael.opdenacker@bootlin.com&gt;</a>

- Update system requirements after making tests on basic Docker
  containers of:
  - Ubuntu 22.04
  - Fedora 37
  - OpenSuse Leap 15.4
  - AlmaLinux 9

- Including the need to have the en_US.UTF-8 locale on the system.

- Rename the CENTOS8_HOST_PACKAGES_ESSENTIAL macro to ALMALINUX_HOST_PACKAGES_ESSENTIAL
  As for the other distros, stop refering to a specific version of AlmaLinux. We mention
  the supported versions in the system-requirements.rst file anyway.

- Remove the unused CENTOS7_HOST_PACKAGES_ESSENTIAL macro

Signed-off-by: Michael Opdenacker <a class="moz-txt-link-rfc2396E" href="mailto:michael.opdenacker@bootlin.com">&lt;michael.opdenacker@bootlin.com&gt;</a>
Reported-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a>
---
 documentation/poky.yaml.in                    | 21 +++++++------------
 .../ref-manual/system-requirements.rst        | 10 ++++-----
 2 files changed, 13 insertions(+), 18 deletions(-)</pre>
    </blockquote>
    <p><br>
    </p>
    <p>LGTM, thanks Michael!</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20230315204247.443297-1-michael.opdenacker@bootlin.com">
      <pre class="moz-quote-pre" wrap="">

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index cdccf6f3ca..44654aa62f 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -13,33 +13,28 @@ YOCTO_RELEASE_DL_URL : &quot;&amp;YOCTO_DL_URL;/releases/yocto/yocto-&amp;DISTRO;&quot;
 UBUNTU_HOST_PACKAGES_ESSENTIAL : &quot;gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     python3-subunit mesa-common-dev zstd liblz4-tool&quot;
+     python3-subunit mesa-common-dev zstd liblz4-tool file locales
+     \n\      $ sudo locale-gen en_US.UTF-8&quot;
 FEDORA_HOST_PACKAGES_ESSENTIAL : &quot;gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
      python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
-     perl-File-Copy perl-locale zstd lz4&quot;
+     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en&quot;
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : &quot;python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
-     zstd lz4
+     zstd lz4 bzip2 gzip hostname
      \n\      $ sudo pip3 install GitPython&quot;
-CENTOS7_HOST_PACKAGES_ESSENTIAL : &quot;-y epel-release
-     \n\      $ sudo yum makecache
-     \n\      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
-     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
-     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip xz \
-     which SDL-devel mesa-libGL-devel zstd lz4
-     \n\      $ sudo pip3 install GitPython jinja2&quot;
-CENTOS8_HOST_PACKAGES_ESSENTIAL : &quot;-y epel-release
-     \n\      $ sudo dnf config-manager --set-enabled PowerTools
+ALMALINUX_HOST_PACKAGES_ESSENTIAL : &quot;-y epel-release
+     \n\      $ sudo yum install dnf-plugins-core
+     \n\      $ sudo dnf config-manager --set-enabled crb
      \n\      $ sudo dnf makecache
      \n\      $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
-     rpcgen mesa-libGL-devel zstd lz4&quot;
+     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en&quot;
 PIP3_HOST_PACKAGES_DOC : &quot;$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml&quot;
 MIN_PYTHON_VERSION : &quot;3.8.0&quot;
 MIN_TAR_VERSION : &quot;1.28&quot;
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 38d4aaf5a7..1bbe7b894d 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -168,16 +168,16 @@ supported openSUSE Linux distribution:
       &amp;PIP3_HOST_PACKAGES_DOC;
 
 
-AlmaLinux-8 Packages
---------------------
+AlmaLinux Packages
+------------------
 
 Here are the required packages by function given a
-supported AlmaLinux-8 Linux distribution:
+supported AlmaLinux Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
    system::
 
-      $ sudo dnf install &amp;CENTOS8_HOST_PACKAGES_ESSENTIAL;
+      $ sudo dnf install &amp;ALMALINUX8_HOST_PACKAGES_ESSENTIAL;
 
    .. note::
 
@@ -186,7 +186,7 @@ supported AlmaLinux-8 Linux distribution:
          easy installation of packages not included in enterprise Linux
          by default. You need to install these packages separately.
 
-      -  The ``PowerTools`` repo provides additional packages such as
+      -  The ``PowerTools/CRB`` repo provides additional packages such as
          ``rpcgen`` and ``texinfo``.
 
       -  The ``makecache`` command consumes additional Metadata from
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------H0RZjD0ZDN6yRGSz3oeMeEIQ--

